FROM alpine:latest

COPY keepalived.sh /usr/bin/keepalived.sh

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk --update -t add keepalived iproute2 grep bash tcpdump && rm -f /var/cache/apk/* /tmp/* && chmod +x /usr/bin/keepalived.sh

ENTRYPOINT ["/usr/bin/keepalived.sh"]
