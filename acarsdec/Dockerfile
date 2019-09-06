FROM alpine:3.9 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="rtlamr" \
      org.label-schema.description="Multi-arch Docker container for acarsdec" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acarsdec" \
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
        libusb

FROM base as builder

RUN apk add --no-cache \
        sudo git build-base cmake \
        librtlsdr-dev@testing \
        libc-dev \
        libusb-dev

RUN git clone "https://github.com/TLeconte/acarsdec.git" && \
    cd acarsdec && \
    mkdir build && cd build && \
    cmake .. -Drtl=ON && \
    make && sudo make install
    
FROM base

COPY --from=builder /usr/local/bin/acarsdec /usr/local/bin/acarsdec
COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
