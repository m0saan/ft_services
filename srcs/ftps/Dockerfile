FROM alpine:latest
EXPOSE 21
RUN apk add vsftpd openrc supervisor
COPY srcs/vsftpd.conf /etc/vsftpd.conf
COPY srcs/run.sh .

RUN chmod +x run.sh

CMD sh run.sh