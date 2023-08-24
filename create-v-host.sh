#!/bin/bash

# Prompt user for domain name
read -p "Enter the domain name (e.g., example.com): " domain

# Prompt user for document root directory
read -p "Enter the document root directory: " docroot

# Prompt user for email address
read -p "Enter the email address associated with the domain: " email

# Create virtual host configuration file
echo "
<VirtualHost *:80>
    ServerName $domain
    ServerAlias www.$domain
    DocumentRoot $docroot

    <Directory $docroot>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    ServerAdmin $email
</VirtualHost>
" > /etc/apache2/sites-available/$domain.conf

# Enable virtual host
a2ensite $domain

# Reload Apache2
systemctl reload apache2

# Add domain to hosts file
echo "
127.0.0.1 $domain
127.0.0.1 www.$domain
" >> /etc/hosts

echo "Virtual host created successfully for $domain"
