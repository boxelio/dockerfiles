FROM alpine:3.9 as base

ENV FEED_SOURCE_HOST="localhost"
ENV FEED_SOURCE_PORT="30005"
ENV ADSB_EXCHANGE_SERVER="feed.adsbexchange.com"
ENV ADSB_EXCHANGE_PORT="30005"
ENV ADSB_EXCHANGE_USERNAME="dockertest-01"

ENV GIT_SOURCE="https://github.com/adsbxchange/adsb-exchange.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="feeder-adsb-exchange" \
      org.label-schema.description="Multi-arch Docker image for a feeder to ADSB Exchange" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/feeder-adsb-exchanget" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN cat /etc/apk/repositories && \
    apk add --no-cache \
        tini \
        socat \
        git

# RUN git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /root/feeder-adsb-exchange
# RUN chmod +x /root/feeder-adsb-exchange/scripts/adsbexchange-feed.sh

COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
