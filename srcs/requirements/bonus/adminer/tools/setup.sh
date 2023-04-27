#!/bin/sh

mkdir -p /var/www/html

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

wget http://www.adminer.org/latest.php -O /var/www/html/adminer.php

sed -i "s|/run/php/php7.3-fpm.sock|9000|" /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

exec $@