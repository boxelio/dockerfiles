FROM alpine:3.9 as base

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
        ncurses-dev

FROM base as builder

RUN apk add --no-cache \
        sudo git build-base cmake \
        librtlsdr-dev@testing \
        libc-dev \
        libusb-dev

RUN git clone "https://github.com/flightaware/dump1090.git" /root/dump1090 && \
    cd /root/dump1090 && make BLADERF=no && make faup1090 BLADERF=no
    
FROM base

COPY --from=builder /root/dump1090/dump1090 /usr/local/bin/dump1090
COPY --from=builder /root/dump1090/view1090 /usr/local/bin/view1090
COPY --from=builder /root/dump1090/faup1090 /usr/local/bin/faup1090
COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
