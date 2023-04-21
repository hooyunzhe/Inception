FROM debian:buster

RUN apt update
RUN apt install redis-server -y

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["redis-server", "--protected-mode", "no"]