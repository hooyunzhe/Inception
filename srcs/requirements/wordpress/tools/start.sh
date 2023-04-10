#!/bin/bash

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz

mv wordpress/* /usr/share/wordpress/

chown -R www-data:www-data /usr/share/wordpress/
chmod -R 755 /usr/share/wordpress/