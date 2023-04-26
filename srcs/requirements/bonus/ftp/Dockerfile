FROM debian:buster

RUN apt update
RUN apt install vsftpd -y

COPY conf/vsftpd.conf /conf/

COPY tools/setup.sh /tools/
RUN chmod +x /tools/setup.sh
ENTRYPOINT ["/tools/setup.sh"]
CMD ["vsftpd", "/conf/vsftpd.conf"]