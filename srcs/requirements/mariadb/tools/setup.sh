#!/bin/sh

echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_ADMIN'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'localhost' WITH GRANT OPTION;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
FLUSH PRIVILEGES;" > /tools/init.sql

mysql_install_db --user=mysql > /dev/null
mysqld --user=mysql --bootstrap < /tools/init.sql
mysqld_safe
