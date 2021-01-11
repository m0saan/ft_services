#  -*- This is a Dockerfile -*-

FROM    alpine:latest
RUN     apk update
RUN     apk add nginx
RUN     apk add supervisor
RUN	    apk add openssl
RUN	    apk add openssh
RUN     apk add openrc
RUN     mkdir -p /run/nginx
RUN     mkdir -p /www

COPY    srcs/start.sh      .
COPY    srcs/build.sh      .
COPY   /srcs/supervisord.conf  /etc/supervisord.conf
COPY    srcs/nginx.conf    /etc/nginx/nginx.conf
COPY    srcs/index.html    /www/

RUN openrc
RUN touch /run/openrc/softlevel
RUN adduser -D -g 'www' www

# Create a directory for html files
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

EXPOSE  80
VOLUME [ "/sys/fs/cgroup" ]


RUN     chmod +x start.sh
CMD     sh start.sh
