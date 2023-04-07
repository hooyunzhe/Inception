FROM debian:buster

COPY conf conf
COPY tools tools

RUN "apt" "update"
RUN "apt" "install" "nginx" "-y"
RUN "apt" "install" "ufw" "-y"

RUN "ufw" "allow" "Nginx HTTPS"

CMD ["nginx", "-p", ".", "-c", "conf/default.conf"]