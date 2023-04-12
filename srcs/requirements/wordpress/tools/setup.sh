#!/bin/sh

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

cp wp-config-sample.php wp-config.php

sed -i s/database_name_here/$MYSQL_DATABASE/ wp-config.php
sed -i s/username_here/$MYSQL_ADMIN/ wp-config.php
sed -i s/password_here/$MYSQL_ADMIN_PASSWORD/ wp-config.php
sed -i s/localhost/$MYSQL_HOST/ wp-config.php

sed -i s/\\/run\\/php\\/php7\\.3-fpm\\.sock/9000/ /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F -R
# sleep 10000