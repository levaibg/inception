FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-fpm php-mysql wget tar vim php-cli mariadb-client


RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz  

RUN  tar -xzf latest.tar.gz \
&& cd wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar 

RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's|/run/php/php7.4-fpm.sock|9000|g' /etc/php/7.4/fpm/pool.d/www.conf

COPY setup.sh /setup.sh

RUN chmod +x /setup.sh

RUN mkdir data

CMD ["/setup.sh"]