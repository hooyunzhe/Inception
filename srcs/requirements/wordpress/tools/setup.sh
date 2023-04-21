#!/bin/sh

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

if [ -f "./wp-config.php" ]
then
	echo "Wordpress has already been installed!"
else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root

	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_ADMIN --dbpass=$MYSQL_ADMIN_PASSWORD --dbhost=$MYSQL_HOST --allow-root

	wp config set WP_SITEURL https://$DOMAIN_NAME --allow-root
	wp config set WP_HOME https://$DOMAIN_NAME --allow-root

	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_REDIS_DATABASE 0 --raw --allow-root
	wp config set WP_REDIS_PREFIX $DOMAIN_NAME --allow_root
	wp config set WP_REDIS_TIMEOUT 1 --raw --allow_root
	wp config set WP_REDIS_READ_TIMEOUT 1 --raw --allow_root

	wp core install --url=$DOMAIN_NAME --title=Inception --admin_name=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PASSWORD --admin_email=$MYSQL_ADMIN$WP_EMAIL_DOMAIN --allow-root

	wp user create $WP_USER $WP_USER$WP_EMAIL_DOMAIN --user_pass=$WP_USER_PASSWORD --role=author --allow-root

	wp plugin install redis-cache --allow-root
	wp plugin update --all --allow-root
	wp plugin activate redis-cache --allow-root

	wp redis enable --allow-root
fi

sed -i s/\\/run\\/php\\/php7.3-fpm.sock/9000/ /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

exec $@
