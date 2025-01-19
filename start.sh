#!/bin/sh

# Check if the .env file exists
if [ ! -f /var/www/html/.env ]; then
  echo "Creating /var/www/html/.env file with current environment variables..."
  
  # Write all environment variables to the .env file
  printenv | while IFS= read -r line; do
    # Escape special characters in variable values to ensure compatibility
    key=$(echo "$line" | cut -d'=' -f1)
    value=$(echo "$line" | cut -d'=' -f2- | sed 's/"/\\"/g')
    
    # Append to the .env file
    echo "$key=\"$value\"" >> /var/www/html/.env
  done

  echo "/var/www/html/.env file created successfully."
else
  echo "/var/www/html/.env already exists. Skipping creation."
fi

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
php artisan passport:keys --force
php artisan route:cache
php artisan view:cache
php artisan config:cache
php artisan horizon:install

sleep 3

# Now start nginx in the foreground
echo "Starting nginx..."
nginx -g 'daemon off;'
