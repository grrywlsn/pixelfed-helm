#!/bin/sh

# Start PHP-FPM in the background
php-fpm &

# Wait for PHP-FPM to be fully available (e.g., waiting for the socket to be ready)
echo "Waiting for PHP-FPM to start..."
until nc -zv 127.0.0.1 9000; do
  echo "Waiting for PHP-FPM to be ready..."
  sleep 1
done

# Run Laravel Passport installation command
echo "Running 'php artisan commands..."
php artisan storage:link
php artisan migrate --force
php artisan import:cities
php artisan instance:actor
php artisan passport:keys --force
php artisan route:cache
php artisan view:cache
php artisan config:cache
php artisan horizon:install
php artisan horizon:publish

# Substitute in APP_DOMAIN to nginx config
envsubst '${APP_DOMAIN}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Now start nginx in the foreground
echo "Starting nginx..."
nginx -g 'daemon off;'
