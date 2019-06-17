FROM alpine:3.9.4

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && apk update && apk add postfix

EXPOSE 25 465 587

ENTRYPOINT ["/usr/sbin/postfix", "start-fg"]
