#!/bin/bash

# Update system
echo "Updating system packages..."
apt update && apt upgrade -y

# Install required dependencies
echo "Installing required dependencies..."
apt install -y software-properties-common curl zip unzip git

# Add PPA for PHP 8.2 and update package list
echo "Adding PHP 8.2 PPA..."
add-apt-repository ppa:ondrej/php -y
apt update

# Install PHP 8.2 and extensions
echo "Installing PHP 8.2 and required extensions..."
apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-common php8.2-mysql php8.2-xml php8.2-json php8.2-mbstring php8.2-zip php8.2-gd php8.2-curl

# Install Composer
echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js and NPM
echo "Installing Node.js and NPM..."
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt install -y nodejs

# Install and configure MySQL
echo "Installing and configuring MySQL..."
apt install -y mysql-server
mysql_secure_installation

# Install required NPM packages and compile assets
echo "Installing NPM packages and compiling assets..."
npm install
npm run dev

# Generate an application key
echo "Generating application key..."
php artisan key:generate

echo "Laravel 10 environment setup complete!"

