FROM debian:buster

RUN apt update
RUN apt install nginx -y

COPY conf/nginx.conf /conf/
COPY tools/ /var/www/html/

CMD ["nginx", "-c", "/conf/nginx.conf"]