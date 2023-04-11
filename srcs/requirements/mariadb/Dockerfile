FROM debian:buster

COPY ./ ./

RUN apt update
RUN apt install mariadb-server expect -y

RUN chmod +x /tools/start.sh
# CMD ["./tools/start.sh"]