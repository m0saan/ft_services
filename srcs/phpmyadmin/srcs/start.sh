#! /bin/bash

adduser -G www-data -D www-data
chown -R www-data:www-data /var/www/phpmyadmin
supervisord -c /etc/supervisord.conf & tail -f /dev/null
