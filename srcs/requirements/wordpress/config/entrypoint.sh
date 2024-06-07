#!/usr/bin/env sh

# Install wp cli program
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /www/wordpress
rm -f wp-config.php

# Connect to the database
# while ! wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD; do
# 	echo "[ENTRYPOINT] Connecting to database ..."
# 	echo --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD
# 	sleep 1
# done
sleep 20
wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD
echo --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD
wp core install --url=$HOST_42 --title=$HOST_42 --admin_user=$WP_SUPER_USER --admin_email=$WP_EMAIL

exec $@