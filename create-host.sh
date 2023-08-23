#!/bin/bash

# Prompt the user to enter the domain name
read -p "Enter the domain name: " domain

# Prompt the user to enter the document root directory
read -p "Enter the document root directory: " documentRoot

# Prompt the user to enter the email address
read -p "Enter the email address: " email

# Define the virtual host configuration file
confFile="/etc/apache2/sites-available/$domain.conf"

# Create the virtual host configuration file
echo "<VirtualHost *:80>
    ServerAdmin $email
    ServerName $domain
    ServerAlias www.$domain
    DocumentRoot $documentRoot

    <Directory $documentRoot>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/$domain.log
    CustomLog \${APACHE_LOG_DIR}/$domain.log combined
</VirtualHost>" | sudo tee $confFile > /dev/null

# Enable the virtual host
sudo a2ensite $domain.conf

# Reload Apache
sudo systemctl reload apache2

# Add the domain and the www alias to the hosts file
echo "127.0.0.1 $domain www.$domain" | sudo tee -a /etc/hosts > /dev/null

echo "Virtual host created successfully for $domain"
