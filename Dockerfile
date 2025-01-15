# Stage 1: Build stage
FROM php:8.3-fpm-alpine AS build

# Install build dependencies
RUN apk add --no-cache \
    git \
    curl \
    unzip \
    autoconf \
    g++ \
    make \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libzip-dev \
    postgresql-dev \
    icu-dev \
    oniguruma-dev \
    bash

# Install PHP extensions
RUN docker-php-ext-configure gd --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) \
    gd \
    intl \
    pcntl \
    pdo \
    pdo_pgsql \
    mbstring \
    zip \
    bcmath \
    opcache

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html
RUN chown -R $(id -u):$(id -g) /var/www/html

# Clone Pixelfed repository
RUN git clone https://github.com/pixelfed/pixelfed.git . --depth=1

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Stage 2: Production stage
FROM php:8.2-fpm-alpine

# Copy runtime dependencies from build stage
COPY --from=build /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=build /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=build /usr/bin/composer /usr/bin/composer

# Install runtime dependencies
RUN apk add --no-cache \
    libpng \
    libjpeg-turbo \
    libwebp \
    libzip \
    postgresql-libs \
    icu-libs \
    oniguruma

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY --from=build /var/www/html /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
