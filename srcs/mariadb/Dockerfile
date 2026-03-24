FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

COPY createdb.sh /createdb.sh
COPY my.cnf /etc/mysql/my.cnf

RUN chmod +x /createdb.sh

# CMD ["/mysqld_safe"]

# CMD [""] SELECT user_login, user_email FROM wp_users;
CMD ["/createdb.sh"]
