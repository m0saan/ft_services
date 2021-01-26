FROM 	alpine:3.11

RUN		apk add supervisor
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache	
RUN		apk update && apk add openrc --no-cache && \
		apk add influxdb && \
		openrc && touch /run/openrc/softlevel
RUN		mkdir -p /etc/telegraf/

COPY	/srcs/start.sh				/
COPY	/srcs/telegraf.conf			/etc/telegraf/telegraf.conf
COPY	/srcs/supervisord.conf			/etc/supervisord.conf


EXPOSE	8086 8088

RUN 		chmod +x start.sh

ENTRYPOINT sh start.sh
