# Stage 1: Build stage
FROM php:8.3-fpm-alpine AS build

# Install build dependencies
RUN apk add --no-cache \
    autoconf \
    bash \
    curl \
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

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html
RUN chown -R $(id -u):$(id -g) /var/www/html

# Clone Pixelfed repository
RUN git clone https://github.com/pixelfed/pixelfed.git . --depth=1

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader  --ignore-platform-reqs

# Stage 2: Production stage
FROM php:8.3-fpm-alpine

# Copy runtime dependencies from build stage
COPY --from=build /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=build /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=build /usr/bin/composer /usr/bin/composer

# Install runtime dependencies
RUN apk add --no-cache \
    icu-libs \
    libjpeg-turbo \
    libpng \
    libwebp \
    libzip \
    nginx \
    oniguruma \
    postgresql-libs

# Set up nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY --from=build /var/www/html /var/www/html

# Set permissions
RUN mkdir -p /var/lib/nginx/logs /var/lib/nginx/tmp /var/cache/nginx  /var/run/nginx
RUN chown -R www-data:www-data /var/lib/nginx /var/www/html /var/cache/nginx /var/log/nginx /var/run/nginx
USER www-data

# Expose port
EXPOSE 80 9000

# Start PHP-FPM
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
