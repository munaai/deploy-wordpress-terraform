#!/bin/bash
# Update and install required packages
apt update -y
apt install apache2 php php-mysql mysql-server wget unzip -y

# Enable Apache to start on boot and start it now
systemctl enable apache2
systemctl start apache2

# Download and install WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

# Set correct permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Restart Apache to apply changes
systemctl restart apache2
