FROM debian:stable-slim as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="vdlm2dec" \
      org.label-schema.description="Multi-arch Docker container for vdlm2dec" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flight/vdlm2dec" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ENV DESTINATION_HOST="0.0.0.0"
ENV DESTINATION_PORT="5555"
ENV FREQUENCIES="136.650 136.800 136.975"
ENV STATION_IDENT="XX-YYYY-VDLM2DEC"
ENV RTL_DEVICE="0"
ENV RTL_GAIN="0"
ENV VDLM2DEC_OPTIONS="-v -J -G -E -U"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update
RUN apt install -y \
        tini \
        librtlsdr-dev \
        libusb-dev

FROM base as builder

RUN apt install -y \
        sudo git build-essential cmake \
        libc-dev \
        libxml2-dev \
        zlib1g-dev

RUN git clone "https://github.com/szpajder/libacars.git" && \
    cd libacars && \
    mkdir build && cd build && \
    cmake ../ && \
    make && \
    sudo make install && \
    sudo ldconfig

RUN git clone "https://github.com/TLeconte/vdlm2dec.git" && \
    cd vdlm2dec && \
    mkdir build && cd build && \
    cmake .. -Drtl=ON && \
    make && sudo make install

FROM base

COPY --from=builder /usr/local/bin/vdlm2dec /srv/vdlm2dec
WORKDIR /srv
COPY start.sh start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/srv/start.sh"]
