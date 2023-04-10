FROM debian:buster

COPY ./ ./

RUN apt update
RUN apt install php-fpm wget -y

RUN service php7.3-fpm start

RUN chmod +x /tools/start.sh
CMD ["./tools/start.sh"]
