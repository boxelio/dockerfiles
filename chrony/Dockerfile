FROM alpine:3.9

RUN apk add --no-cache chrony tini

COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp
EXPOSE 323/udp

ENTRYPOINT [ "tini", "--" ]

CMD ["/usr/sbin/chronyd","-d"]
