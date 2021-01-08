FROM	alpine


RUN     apk add nginx
RUN     apk add supervisor
RUN		RUN apk add php wget php7-fpm phpmyadmin php-mbstring php-gettext  php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		mkdir -p /var/www/phpmyadmin && mv phpMyAdmin-4.9.2-all-languages/* /var/www/phpmyadmin/ \
		&& rm -rf phpMyAdmin-4.9.2-all-languages

#COPY	/srcs/config.inc.php		/var/www/phpmyadmin/
COPY	/srcs/start.sh				/
COPY    /srcs/supervisord.conf  /etc/supervisord.conf
RUN     mkdir -p /run/nginx
RUN     chmod +x start.sh

EXPOSE	5000

ENTRYPOINT sh start.sh
