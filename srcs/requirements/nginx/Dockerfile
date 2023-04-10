FROM debian:buster

COPY ./ ./

RUN apt update
RUN apt install nginx openssl -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/hyun-zhe.key -out /etc/nginx/ssl/hyun-zhe.crt -config conf/ssl_cert.conf

CMD ["nginx", "-p", ".", "-c", "conf/default.conf"]