FROM debian:buster

RUN apt update
RUN apt install wget php php-fpm php-mysql -y

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F", "-R"]