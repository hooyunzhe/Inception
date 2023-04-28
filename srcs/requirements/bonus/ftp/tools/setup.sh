#!/bin/sh

adduser $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/html

mkdir -p /var/ftp/empty

exec $@