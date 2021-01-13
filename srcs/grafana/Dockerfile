FROM	alpine

RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	/srcs/start.sh				/

WORKDIR	/usr/share/grafana

EXPOSE	3000

ENTRYPOINT	sh /start.sh
