FROM 	alpine

RUN		apk update && apk add openrc --no-cache && \
		apk add influxdb && \
		openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf

COPY	/srcs/start.sh				/

EXPOSE	8086

ENTRYPOINT sh start.sh
