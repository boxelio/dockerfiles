FROM alpine:3.10 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="rtl_433" \
      org.label-schema.description="Multi-arch Docker container for rtl_433" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/rtl_433" \
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
        git build-base cmake \
        librtlsdr-dev@testing \
        libc-dev \
        libusb-dev

RUN git clone "https://github.com/merbanan/rtl_433.git" /tmp/rtl_433 && \
    mkdir -p /tmp/rtl_433/build && \
    cd /tmp/rtl_433/build && \
    cmake .. && \
    make && \
    make install && \
    find /usr/local/bin -type f -exec strip -p --strip-debug {} \;

FROM base

COPY --from=builder /usr/local/bin/rtl_433 /usr/local/bin/rtl_433
COPY --from=builder /usr/local/etc/rtl_433/* /usr/local/etc/rtl_433/

ENTRYPOINT ["tini", "--"]

CMD ["/usr/local/bin/rtl_433"]
