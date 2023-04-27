FROM debian:buster

RUN apt update
RUN apt install wget nginx php php-fpm php-mysql -y

COPY conf/nginx.conf /conf/

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["nginx", "-c", "/conf/nginx.conf"]