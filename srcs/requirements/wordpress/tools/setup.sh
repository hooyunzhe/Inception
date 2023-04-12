#!/bin/sh

mv wordpress/* .

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

cp wp-config-sample.php wp-config.php

sed -i s/database_name_here/$MYSQL_DATABASE/ wp-config.php
sed -i s/username_here/$MYSQL_ADMIN/ wp-config.php
sed -i s/password_here/$MYSQL_ADMIN_PASSWORD/ wp-config.php
sed -i s/localhost/$MYSQL_HOST/ wp-config.php

service php7.3-fpm start