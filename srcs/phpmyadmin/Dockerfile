FROM	alpine:3.11

RUN     apk update
RUN     apk add nginx
RUN     apk add supervisor
RUN		apk add php php7-fpm phpmyadmin php-mbstring php-gettext  php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN		mkdir -p /var/www/phpmyadmin
RUN     cd /var/www/phpmyadmin
RUN     mkdir /etc/nginx/ssl
RUN     chown -R root:root /etc/nginx/ssl
RUN     chmod 600 /etc/nginx/ssl

COPY    srcs/phpMyAdmin-5.0.4-english.tar.gz /
RUN     tar zxvf phpMyAdmin-5.0.4-english.tar.gz
RUN     mv phpMyAdmin-5.0.4-english/* /var/www/phpmyadmin
RUN     rm -rf /var/www/phpmyadmin/config.sample.inc.php
RUN     apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf


COPY     /srcs/telegraf.conf /etc/telegraf/
COPY	/srcs/start.sh				/
COPY    /srcs/supervisord.conf  /etc/supervisord.conf
COPY    /srcs/nginx.conf    /etc/nginx/nginx.conf
COPY    /srcs/config.inc.php .
COPY    srcs/localhost.key  /etc/nginx/ssl
COPY    srcs/localhost.crt  /etc/nginx/ssl


RUN     cp config.inc.php /var/www/phpmyadmin/
RUN     mkdir -p /run/nginx
RUN     chmod +x start.sh

CMD sh start.sh

EXPOSE	5000
