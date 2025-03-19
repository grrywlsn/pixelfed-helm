# Stage 1: Build stage
FROM php:8.4-fpm-alpine3.20 AS build

# renovate: datasource=github-releases depName=pixelfed/pixelfed
# ARG PIXELFED_VERSION="v0.12.4"
ARG PIXELFED_VERSION="917f6759fc6470022f09cc856a66b6c86659ad63"

# Install build dependencies
RUN apk add --no-cache \
    autoconf \
    bash \
    curl \
    g++ \
    gcc \
    git \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    make \
    oniguruma-dev \
    postgresql-dev \
    unzip \
    && rm -rf /var/cache/apk/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) \
    bcmath \
    exif \
    gd \
    intl \
    pdo_pgsql \
    pgsql \
    zip

# Install Redis PHP extension
RUN pecl install redis && \
    docker-php-ext-enable redis

# Install pcntl extension
RUN docker-php-ext-configure pcntl --enable-pcntl \
  && docker-php-ext-install pcntl;


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions imagick

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Clone Pixelfed repository
RUN git clone https://github.com/pixelfed/pixelfed.git . && git checkout ${PIXELFED_VERSION}

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader  --ignore-platform-reqs

# Stage 2: Production stage
FROM php:8.4-fpm-alpine3.20

# Copy runtime dependencies from build stage
COPY --from=build /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=build /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=build /usr/bin/composer /usr/bin/composer

# Install runtime dependencies
RUN apk add --no-cache \
    icu-libs \
    imagemagick \
    libjpeg-turbo \
    libpng \
    libwebp \
    libxpm \
    libzip \
    netcat-openbsd \
    nginx \
    oniguruma \
    postgresql-libs \
    sed \
    shadow

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY --from=build /var/www/html /var/www/html
COPY --from=build /var/www/html/storage/app/public /var/www/html/storage/app/public-stock

# Modify `config/database.php` and `config/cache.php` to add REDIS_USERNAME and REDIS_PREFIX after REDIS_PASSWORD
RUN sed -i '/REDIS_PASSWORD/ a\            '\''username'\'' => env('\''REDIS_USERNAME'\'', null),' /var/www/html/config/database.php \
    && sed -i '/REDIS_PASSWORD/ a\            '\''prefix'\''   => env('\''REDIS_PREFIX'\'', '\''pixelfed_'\''),' /var/www/html/config/database.php \
    && sed -i '/REDIS_PASSWORD/ a\                '\''prefix'\''   => env('\''REDIS_PREFIX'\'', '\''pixelfed_'\''),' /var/www/html/config/cache.php \
    && sed -i '/REDIS_PASSWORD/ a\                '\''username'\'' => env('\''REDIS_USERNAME'\'', null),' /var/www/html/config/cache.php

# Set permissions
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN mkdir -p /var/lib/nginx/logs /var/lib/nginx/tmp /var/cache/nginx  /var/run/nginx && touch /var/run/nginx.pid && touch /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx /var/www/html /var/cache/nginx /var/log/nginx /var/run/nginx /var/run/nginx.pid /etc/nginx/nginx.conf
USER www-data

# Copy nginx configuration + start script into the container
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /usr/local/bin/start.sh
COPY php.ini /usr/local/etc/php/php.ini

# Expose port
EXPOSE 8080 9000

# Start PHP-FPM
CMD ["/bin/sh", "/usr/local/bin/start.sh"]