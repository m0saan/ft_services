#  -*- This is a Dockerfile -*-

FROM    alpine:latest
RUN     apk update
RUN     apk add nginx
RUN     apk add supervisor
RUN	    apk add openssl
RUN	    apk add openssh
RUN     apk add openrc
RUN     mkdir -p /run/nginx

COPY    /srcs/start.sh      .
COPY    /srcs/build.sh      .
COPY    /srcs/supervisord.conf  /etc/supervisord.conf
COPY    /srcs/nginx.conf        //etc/nginx/nginx.conf
COPY    /srcs/sshd_config   /etc/ssh/sshd_config

EXPOSE  80

RUN     chmod +x start.sh
CMD     sh start.sh
