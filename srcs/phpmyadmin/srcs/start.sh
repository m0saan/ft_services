#! /bin/bash

#wget  http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages/* /var/www/phpmyadmin
cp config.inc.php /var/www/phpmyadmin
rm -rf /var/www/phpmyadmin/config.sample.inc.php
adduser -G www-data -D www-data
chown -R www-data:www-data /var/www/phpmyadmin
#telegraf &
#php-fpm7 --nodaemonize  &
#nginx -g 'daemon off;'
supervisord -c /etc/supervisord.conf & tail -f /dev/null