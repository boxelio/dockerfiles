FROM debian:stable-slim as base

# GENERAL
ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV GIT_SOURCE="https://github.com/Mictronics/readsb.git"
ENV GIT_BRANCH="master"

# READSB
ENV READSB_RAW_INPUT_PORT="30001"
ENV READSB_RAW_OUTPUT_PORT="30002"
ENV READSB_SBS_OUTPUT_PORT="30003"
ENV READSB_BEAST_INPUT_PORT="30004"
ENV READSB_BEAST_OUTPUT_PORT="30005"
ENV READSB_DECODER_OPTIONS="--max-range 800"
ENV READSB_JSON_OPTIONS="--json-location-accuracy 1"
ENV READSB_NET_OPTIONS="--net --net-heartbeat 60 --net-ro-size 1000 --net-ro-interval 1 --net-ri-port 0 --net-ro-port 30002 --net-sbs-port 30003 --net-bi-port 30004,30104 --net-bo-port 30005"
# Disable READSB_RECEIVER_OPTIONS if using airspy
#ENV READSB_RECEIVER_OPTIONS="--device 0 --device-type rtlsdr --gain -10 --ppm 0"
ENV READSB_RECEIVER_OPTIONS="--net-only"

# AIRSPY
ENV USE_AIRSPY="true"
ARG AIRSPY_ADSB_URL="https://airspy.com/downloads/airspy_adsb-linux-arm.tgz"
ENV AIRSPY_BIAS="-b"
ENV AIRSPY_GAIN=15
ENV AIRSPY_PREAMBLE="9.87"
ENV AIRSPY_OPTIONS="-v -f 2 -t 300"
ENV AIRSPY_SAMPLE_RATE=20
ENV AIRSPY_NET="-l 33333:beast"
ENV AIRSPY_G="-g"
ENV AIRSPY_M="-m"
ENV AIRSPY_P="-e"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="readsb" \
      org.label-schema.description="Multi-arch Docker image for readsb, an alternative to dump1090" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/readsb" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update
RUN apt install -y \
        tini \
        ncurses-dev \
        lighttpd \
        librtlsdr-dev \
        libusb-dev

FROM base as builder

RUN apt install -y \
        sudo git build-essential cmake \
        libc-dev \
        ncurses-dev \
        pkg-config \
        wget

RUN wget -O /tmp/airspy_adsb.tgz ${AIRSPY_ADSB_URL} && tar zxvf /tmp/airspy_adsb.tgz && mv airspy_adsb /usr/local/bin

RUN git clone -b $GIT_BRANCH $GIT_SOURCE /tmp/readsb && \
    cd /tmp/readsb && make RTLSDR=yes

RUN ls -l /tmp/readsb/

FROM base

RUN mkdir -p /usr/share/readsb/html

COPY --from=builder /tmp/readsb/readsb /usr/local/bin/readsb
COPY --from=builder /tmp/readsb/viewadsb /usr/local/bin/viewadsb
COPY --from=builder /tmp/readsb/webapp/src/* /usr/share/readsb/html
COPY --from=builder /tmp/readsb/debian/lighttpd/* /etc/lighttpd/conf-available/
COPY --from=builder /usr/local/bin/airspy_adsb /usr/local/bin/airspy_adsb
COPY start.sh /start.sh

RUN lighty-enable-mod readsb
RUN lighty-enable-mod readsb-statcache

EXPOSE ${RAW_INPUT_PORT}
EXPOSE ${RAW_OUTPUT_PORT}
EXPOSE ${SBS_OUTPUT_PORT}
EXPOSE ${BEAST_INPUT_PORT}
EXPOSE ${BEAST_OUTPUT_PORT}

VOLUME ["/run/readsb"]

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
