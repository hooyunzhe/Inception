#!/bin/sh

useradd $FTP_USER
echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | passwd $FTP_USER
chown -R $FTP_USER:$FTP_USER /var/www/html

mkdir -p /var/ftp/empty

exec $@