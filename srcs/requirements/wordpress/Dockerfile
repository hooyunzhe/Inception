FROM debian:buster

RUN apt update
RUN apt install php php-fpm php-mysql php-gd wget -y

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["/usr/sbin/php-fpm7.3",  "-F"]