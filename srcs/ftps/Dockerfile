FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd openrc supervisor openssl
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf

RUN     yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

# We create a user
RUN     adduser -D user && echo "user:password" | chpasswd

COPY    srcs/vsftpd.conf        /etc/vsftpd/vsftpd.conf
COPY    srcs/run.sh             /
COPY    srcs/supervisord.conf   /etc/supervisord.conf
COPY    srcs/telegraf.conf      /etc/telegraf/
COPY    srcs/health.sh          /

RUN     mkdir -p /run/openrc/ && touch /run/openrc/softlevel
RUN     chmod +x run.sh

EXPOSE 20 21 30020 30021

CMD     sh run.sh
