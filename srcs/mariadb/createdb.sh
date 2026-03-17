#!/bin/bash

service mariadb start

until mysqladmin ping --silent; do
    sleep 2
done

mysql -e "CREATE DATABASE $MYSQL_DATABASE;"

mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"    

mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe