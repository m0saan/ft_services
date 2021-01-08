#adduser -G www-data -D www-data
#chown -R www-data:www-data /var/www/phpmyadmin
#php-fpm7 --nodaemonize  &
#nginx -g 'daemon off;' 
supervisord -c /etc/supervisord.conf & tail -f /dev/null
