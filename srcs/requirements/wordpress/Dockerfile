FROM debian:buster

RUN apt update
RUN apt install php php-fpm php-mysql php-gd wget -y

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
CMD ["/tools/setup.sh"]