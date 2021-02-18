FROM	alpine:3.11

RUN     apk add supervisor libc6-compat
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf/

COPY    srcs/grafana-7.4.0.linux-amd64.tar.gz /
COPY	srcs/start.sh				/
COPY	srcs/supervisord.conf		/etc/supervisord.conf
COPY	srcs/telegraf.conf		    /etc/telegraf/telegraf.conf

RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
WORKDIR	/grafana-7.4.0/bin/
COPY    /srcs/grafana.db    ../data/grafana.db
COPY    srcs/health.sh      .
EXPOSE	3000

ENTRYPOINT	sh /start.sh
