FROM alpine:latest

RUN		apk add mariadb mariadb-client && \
		mkdir -p /run/mysqld/
COPY	/srcs/start.sh			/
EXPOSE 3306

ENTRYPOINT sh start.sh"
