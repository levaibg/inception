FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

RUN mkdir -p etc/nginx/ssl && cd /etc/nginx/ssl && touch privnginx.key outnginx.crt

RUN openssl req -x509 -nodes -days 365\
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/privnginx.key \
    -out    /etc/nginx/ssl/outnginx.crt \
    -subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/CN=lloginov.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]