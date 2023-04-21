#!/bin/sh

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Wordpress database has already been created"
else
	echo "USE mysql;
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
	CREATE DATABASE $MYSQL_DATABASE;
	CREATE USER '$MYSQL_ADMIN'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
	GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
	GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
	FLUSH PRIVILEGES;" > /tools/init.sql

	sed -i s/127.0.0.1/mariadb/ /etc/mysql/mariadb.conf.d/50-server.cnf

	mysql_install_db --user=mysql > /dev/null
	mysqld --user=mysql --bootstrap < /tools/init.sql
fi

exec $@
