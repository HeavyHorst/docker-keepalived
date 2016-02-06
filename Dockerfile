FROM alpine:latest

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk --no-cache --update -t add keepalived s6 iproute2 grep bash tcpdump
COPY s6 /s6

ENTRYPOINT ["s6-svscan", "/s6"]
