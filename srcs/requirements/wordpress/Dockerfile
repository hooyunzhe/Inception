FROM debian:buster

RUN apt update
RUN apt install wget mariadb-client php php-fpm php-mysql php-gd php-redis -y

WORKDIR /var/www/html

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F", "-R"]