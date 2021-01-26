FROM alpine:3.11

RUN		apk add mariadb mariadb-common mariadb-client openrc && \
		mkdir -p /run/mysqld/
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf

COPY     /srcs/telegraf.conf /etc/telegraf/
COPY	/srcs/start.sh			/
COPY	/srcs/wordpress.sql		/
COPY	/srcs/my.cnf /etc/mysql/my.cnf

RUN     chmod +x start.sh
VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

RUN 	chmod +x start.sh

CMD sh start.sh
