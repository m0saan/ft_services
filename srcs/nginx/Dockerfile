#  -*- This is a Dockerfile -*-

FROM    alpine
RUN     apk update
RUN     apk add nginx
RUN     apk add supervisor
RUN     mkdir -p /run/nginx

COPY    /srcs/start.sh      .
COPY    /srcs/nginx.key	/etc/ssl/private/nginx.key
COPY    /srcs/nginx.crt	/etc/ssl/certs/nginx.crt
COPY    /srcs/supervisord.conf  /etc/supervisord.conf

EXPOSE  80 443

RUN     chmod +x start.sh
CMD     sh start.sh
