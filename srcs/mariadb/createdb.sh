#!/bin/bash

service mariadb start

MYSQL_PASSWORD=$(cat /run/secrets/sqlpass)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wpadminpass)
WP_USER_PASSWORD=$(cat /run/secrets/wpuserpass)

until mysqladmin ping --silent; do
    sleep 2
done



mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"    

mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe