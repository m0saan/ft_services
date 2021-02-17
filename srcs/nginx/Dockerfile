#  -*- This is a Dockerfile -*-

FROM    alpine:3.11
RUN     apk update
RUN     apk add nginx
RUN     apk add supervisor
RUN	    apk add openssl
RUN	    apk add openssh
RUN     apk add openrc
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf


RUN     mkdir -p /run/nginx
RUN     mkdir -p /www
RUN     mkdir /etc/nginx/ssl
RUN     chown -R root:root /etc/nginx/ssl
RUN     chmod 600 /etc/nginx/ssl

COPY    srcs/telegraf.conf /etc/telegraf/
COPY    srcs/start.sh      .
COPY    srcs/supervisord.conf   /etc/supervisord.conf
COPY    srcs/nginx.conf         /etc/nginx/
COPY    srcs/ssh_run.sh         /
COPY    srcs/index.html         /www/
COPY    srcs/localhost.key      /etc/nginx/ssl
COPY    srcs/localhost.crt      /etc/nginx/ssl
COPY    srcs/health.sh          /

RUN openrc
RUN touch /run/openrc/softlevel
RUN adduser -D -g 'www' www

# Create a directory for html files
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

EXPOSE  80 443 22
VOLUME [ "/sys/fs/cgroup" ]


RUN     chmod +x start.sh
CMD     sh start.sh
