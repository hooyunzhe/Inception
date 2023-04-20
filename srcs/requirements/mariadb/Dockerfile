FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["mysqld_safe --user=mysql"]