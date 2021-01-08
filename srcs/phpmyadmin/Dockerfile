FROM	alpine

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session && \
		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		mkdir -p /www /etc/telegraf && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

COPY	/srcs/config.inc.php		/www/phpmyadmin/
COPY	/srcs/start.sh				/

EXPOSE	5000

ENTRYPOINT sh start.sh
