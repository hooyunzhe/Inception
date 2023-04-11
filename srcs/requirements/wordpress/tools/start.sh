#!/bin/bash

mv /tmp/wordpress/* /usr/share/wordpress/

chown -R www-data:www-data /usr/share/wordpress/
chmod -R 755 /usr/share/wordpress/