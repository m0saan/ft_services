#  -*- This is a Dockerfile -*-

FROM alpine
RUN apk update
RUN apk add nginx
RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
