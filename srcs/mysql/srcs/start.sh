#!/bin/sh

rm -rf /var/cache/apk/* /etc/my.cnf*

#create necessary folders
mkdir -p /var/lib/mysql /run/mysqld /usr/share/phpmyadmin/tmp

chmod 0777 /usr/share/phpmyadmin/tmp/


#install and start services
mysql_install_db -u root > /dev/null
exec /usr/bin/mysqld -u root --console &
sleep 5


mysql -u root -e 'CREATE DATABASE wordpress;'


# create db admin
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;"

mysql -u root wordpress < /wordpress.sql

# start telegraf

telegraf

#make sure container not to stop
sleep infinity
