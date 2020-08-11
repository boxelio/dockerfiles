FROM alpine:3.10

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="chrony" \
      org.label-schema.description="Multi-arch Docker container for chrony" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/chrony" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache chrony tini

COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp
EXPOSE 323/udp

ENTRYPOINT [ "tini", "--" ]

CMD ["/usr/sbin/chronyd","-d"]
