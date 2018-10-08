#!/bin/bash
# Script to install Nginx and enable on boot.

# Update your system:
apt-get update -y
apt-get upgrade -y

# Install Nginx:
apt-get install -y nginx

#Start Nginx service and enable to start on boot:
systemctl enable nginx
systemctl start nginx

# Create new 'vhost' directory for domain configuration:
mkdir /etc/nginx/vhost.d

# Create a new directory to serve new content.
mkdir -p /var/www/html/rise_path

# Create a copy of original configuration files
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.original

# Replace it with our own script
cp /tmp/nginx.conf /etc/nginx/nginx.conf

# Copy over the server block configuration:
cp /tmp/rise_path.conf /etc/nginx/vhost.d/rise_path.conf

# Copy over the html test page:
cp /tmp/index.html /var/www/html/rise_path/index.html

# Restart Nginx:
systemctl restart nginx
