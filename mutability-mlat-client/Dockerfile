FROM alpine:3.9 as base

ENV INPUT_CONNECT="localhost:30005"
ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV ALTITUDE=0
ENV MLAT_SERVER=""
ENV MLAT_USER=""

ENV GIT_SOURCE="https://github.com/mutability/mlat-client.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="flightaware-dump1090" \
      org.label-schema.description="Multi-arch Docker image for flightaware-dump1090" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flightaware-dump1090" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories
RUN cat /etc/apk/repositories && \
    apk add --no-cache tini \
        librtlsdr@testing \
        libusb \
        ncurses-dev \
        python3-dev

RUN git clone ${GIT_SOURCE} /root/mlat-client && \
    cd /root/mlat-client && ./setup.py install

RUN which mlat-client

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
