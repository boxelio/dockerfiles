FROM alpine:3.10 as base

ENV FEED_SOURCE_HOST="some-remote-host"
ENV FEED_SOURCE_PORT="30002"
ENV FEED_DESTINATION_HOST="localhost"
ENV FEED_DESTINATION_PORT="50001"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="feeder-adsb-exchange" \
      org.label-schema.description="Multi-arch Docker image for a generic socat-based feeder between two dump1090s" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/feeder-dump1090" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN cat /etc/apk/repositories && \
    apk add --no-cache \
        tini \
        socat

COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
