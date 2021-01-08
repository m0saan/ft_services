FROM	alpine

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN		mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/
RUN		wget https://wordpress.org/wordpress-5.6.tar.gz && tar -xzvf wordpress-5.6.tar.gz && rm wordpress-5.6.tar.gz
RUN		mkdir -p /var/www && mv /wordpress /var/www/

COPY	/srcs/wp-config.php			/var/www/wordpress/
COPY	/srcs/start.sh				/

EXPOSE	5050

ENTRYPOINT sh start.sh
