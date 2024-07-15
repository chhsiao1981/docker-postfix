FROM debian:bookworm-slim

RUN DEBIAN_FRONTEND=noninteractive && apt update && apt install -y postfix

EXPOSE 25 465 587

ENTRYPOINT ["/usr/sbin/postfix", "start-fg"]
