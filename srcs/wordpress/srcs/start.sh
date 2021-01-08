#! /bin/bash
adduser -G www-data -D www-data

chown -R www-data:www-data /var/www/wordpress
#php-fpm7 & nginx -g 'daemon off;' 

# Start supervisord
supervisord  -c /etc/supervisord.conf  & tail -f /dev/null