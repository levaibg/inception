#!/bin/bash

cd /var/www/html/wordpress

until mysqladmin ping -h mariadb -u $MYSQL_USER -p$MYSQL_PASSWORD --silent; do
    sleep 2
done

sleep 5 

wp config create \
--dbname=$MYSQL_DATABASE \
--dbuser=$MYSQL_USER \
--dbpass=$MYSQL_PASSWORD \
--dbhost=mariadb \
--allow-root

wp core install \
--url=$DOMAIN_NAME \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN_USER \
--admin_password=$WP_ADMIN_PASSWORD \
--admin_email=$WP_ADMIN_EMAIL \
--allow-root

exec php-fpm7.4 -F