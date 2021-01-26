FROM	alpine:3.11

RUN     apk add supervisor
RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf/

COPY	/srcs/start.sh				/
COPY	/srcs/supervisord.conf		/etc/supervisord.conf
COPY	/srcs/telegraf.conf		    /etc/telegraf/telegraf.conf

WORKDIR	/usr/share/grafana

EXPOSE	3000

ENTRYPOINT	sh /start.sh
