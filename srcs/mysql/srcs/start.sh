#!/bin/sh

rm -rf /var/cache/apk/* /etc/my.cnf*

#create necessary folders
mkdir -p /var/lib/mysql /run/mysqld

#install and start services
mysql_install_db -u root > /dev/null
exec /usr/bin/mysqld -u root --console &
sleep 5


# #create wp db if not already exists
# if ! mysql -u root -e 'USE wordpress'; then
# 	mysql -u root -e 'CREATE DATABASE wordpress;'
# 	# mysql -u root wordpress < /wordpress.sql
# fi

#create db admin
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'passwd';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;"

#avoid container to stop
sleep infinity
