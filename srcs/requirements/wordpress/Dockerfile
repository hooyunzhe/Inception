FROM debian:buster

RUN apt update
RUN apt install php-fpm wget -y

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
CMD ["/tools/setup.sh"]