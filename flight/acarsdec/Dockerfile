FROM alpine:edge as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acarsdec" \
      org.label-schema.description="Multi-arch Docker container for acarsdec" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flight/acarsdec" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ENV DESTINATION_HOST="0.0.0.0"
ENV DESTINATION_PORT="5555"
ENV FREQUENCIES="131.550 131.525 131.725 131.825 130.025 130.425 130.450 131.125"
ENV RTL_DEVICE="0"
ENV RTL_GAIN="0"
ENV STATION_IDENT="XX-YYYY-ACARSDEC"
ENV ACARSDEC_OPTIONS="-v -o 4"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories
RUN cat /etc/apk/repositories && \
    apk add --no-cache tini \
        librtlsdr \
        libusb

FROM base as builder

RUN apk add --no-cache \
        sudo git build-base cmake \
        librtlsdr-dev \
        libc-dev \
        libusb-dev

RUN git clone "https://github.com/TLeconte/acarsdec.git" && \
    cd acarsdec && \
    mkdir build && cd build && \
    cmake .. -Drtl=ON && \
    make && sudo make install

FROM base

COPY --from=builder /usr/local/bin/acarsdec /srv/acarsdec
WORKDIR /srv
COPY start.sh start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/srv/start.sh"]
