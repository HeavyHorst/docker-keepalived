FROM debian:jessie
MAINTAINER kaufmann.r@gmail.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install --no-install-recommends --no-install-suggests -qqy keepalived && rm -rf /var/lib/apt/lists/*

COPY ./bin/start.sh   /opt/bin/start.sh
RUN chmod +x         /opt/bin/start.sh

RUN mkdir -p /etc/keepalived/

ENTRYPOINT [ "/opt/bin/start.sh"]
