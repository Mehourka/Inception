#!/usr/bin/env sh

# Install wp cli program
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /www/wordpress
cd /www/wordpress
wp core download
rm -f wp-config.php

# Connect to the database
while ! mysqladmin ping -h "$DB_HOST";do 
	echo "[ENTRYPOINT] Connecting to database ..."
  sleep 1;
done


# Create wordpress wp-config.php
wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD

# Create WordPress Users
wp core install --url=$HOST_42 --title=$HOST_42 --admin_user=$WP_SUPER_USER --admin_email=$WP_SUPER_EMAIL --admin_password=$WP_SUPER_PASSWORD
wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD

exec $@
