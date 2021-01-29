FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd openrc supervisor openssl && \
	    echo "root:toor" | chpasswd
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     mkdir -p /etc/telegraf

# We create a new user
RUN     { echo "user"; echo "user"; } | adduser user

COPY    srcs/vsftpd.conf /etc/vsftpd.conf
COPY    srcs/run.sh .
COPY    srcs/supervisord.conf /etc/supervisord.conf
COPY    srcs/telegraf.conf /etc/telegraf/

EXPOSE  21 21000

RUN     chmod +x run.sh

CMD     sh run.sh
