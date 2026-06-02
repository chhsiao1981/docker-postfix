FROM debian:trixie-slim

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y postfix

EXPOSE 25 465 587

ENTRYPOINT ["/usr/sbin/postfix", "start-fg"]
