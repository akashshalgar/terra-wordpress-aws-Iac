#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras enable php8.0
sudo yum install -y httpd php php-mysqlnd wget
sudo systemctl start httpd
sudo systemctl enable httpd

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${RDS_DB_NAME}/" wp-config.php
sed -i "s/username_here/${RDS_DB_USERNAME}/" wp-config.php
sed -i "s/password_here/${RDS_DB_PASSWORD}/" wp-config.php
sed -i "s/localhost/${RDS_DB_HOST}/" wp-config.php

chown -R apache:apache /var/www/html
sudo systemctl restart apache2

