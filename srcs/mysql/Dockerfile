FROM alpine:latest

RUN		apk add mariadb mariadb-common mariadb-client openrc && \
		mkdir -p /run/mysqld/
RUN     apk add supervisor

COPY	/srcs/start.sh			/
COPY	/srcs/build.sh			/
COPY    /srcs/supervisord.conf  /etc/supervisord.conf
COPY	/srcs/my.cnf /etc/mysql/my.cnf
COPY    srcs/mysql-service.sql .

RUN     chmod +x build.sh
VOLUME [ "/sys/fs/cgroup" ]

# EXPOSE 3306

ENTRYPOINT sh build.sh
