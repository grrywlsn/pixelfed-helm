#!/bin/sh

# Copy over Pixelfed's stock images (header image, empty avatar etc) since we've mounted the public volume
cp -r /var/www/html/storage/app/public-stock/* /var/www/html/storage/app/public

# Start PHP-FPM in the background
php-fpm &

# Wait for PHP-FPM to be fully available (e.g., waiting for the socket to be ready)
echo "Waiting for PHP-FPM to start..."
until nc -zv 127.0.0.1 9000; do
  echo "Waiting for PHP-FPM to be ready..."
  sleep 1
done

# Run Laravel Passport installation command
echo "Running php artisan commands..."
php artisan storage:link
php artisan migrate --force
php artisan import:cities
php artisan instance:actor
# Passport: use PASSPORT_PRIVATE_KEY / PASSPORT_PUBLIC_KEY from the environment (e.g. K8s
# ExternalSecret) when set so keys are stable across restarts; otherwise generate files once.
if [ -n "${PASSPORT_PRIVATE_KEY}" ] && [ -n "${PASSPORT_PUBLIC_KEY}" ]; then
  echo "Passport keys supplied via environment; skipping passport:keys"
else
  php artisan passport:keys --force
fi
php artisan route:cache
php artisan view:cache
php artisan config:cache
php artisan horizon:install

if [ -n "${PIXELFED_PUSHGATEWAY_KEY}" ]; then
  php artisan app:push-gateway-refresh
fi

sleep 3

# Now start nginx in the foreground
echo "Starting nginx..."
nginx -g 'daemon off;'
