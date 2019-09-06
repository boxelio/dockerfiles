FROM alpine:3.9 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="direwolf" \
      org.label-schema.description="Multi-arch Docker container for direwolf" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/direwolf" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories && \
    cat /etc/apk/repositories && \
    apk add --no-cache tini \
    rtl-sdr@testing \
    hamlib@testing \
    gpsd \
    alsa-lib

FROM base as builder

RUN apk add --no-cache \
    git build-base cmake \
    hamlib-dev@testing \
    libc-dev \
    gpsd-dev \
    alsa-lib-dev \
    linux-headers

RUN git clone "https://github.com/wb2osz/direwolf.git" /tmp/direwolf && \
    echo "#include <unistd.h>" > /usr/include/sys/unistd.h && \
    cd /tmp/direwolf && \
    sed -i 's/--mode=/-m /g' Makefile.linux && \
    sed -i 's/cp -n/cp/g' Makefile.linux && \
    CFLAGS=-D__FreeBSD__ make && make DESTDIR=/target install && \
    find /target/bin -type f -exec strip -p --strip-debug {} \;

FROM base

COPY --from=builder /target/ /usr/local/
COPY --from=builder /etc/udev/rules.d/99-direwolf-cmedia.rules /etc/udev/rules.d/99-direwolf-cmedia.rules

ENV MYCALL n0call \
    IGSERVER noam.aprs2.net \
    IGLOGIN n0call -1 \
    FREQUENCY 144.39M

EXPOSE 8000 8001

ADD sdr.conf /root/sdr.conf
ADD start.sh /root/start.sh

ENTRYPOINT [ "tini", "--", "/bin/sh", "/root/start.sh" ]
