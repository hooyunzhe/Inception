FROM debian:buster


RUN apt update
RUN apt install mariadb-server expect -y

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
CMD ["/tools/setup.sh"]