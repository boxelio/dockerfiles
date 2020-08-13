FROM debian:stable-slim as base

# AIRSPY
ENV AIRSPY_ADSB_PORT="33333"
ENV AIRSPY_BIAS="-b"
ENV AIRSPY_GAIN=15
ENV AIRSPY_PREAMBLE="9.87"
ENV AIRSPY_OPTIONS="-v -f 2 -t 300"
ENV AIRSPY_SAMPLE_RATE=20
ENV AIRSPY_NET="-l 33333:beast"
ENV AIRSPY_G="-g"
ENV AIRSPY_M="-m"
ENV AIRSPY_P="-e"

ARG AIRSPY_ADSB_URL="https://airspy.com/downloads/airspy_adsb-linux-arm.tgz"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="airspy_adsb" \
      org.label-schema.description="Multi-arch Docker image for airspy_adsb" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flight/airspy-adsb" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update
RUN apt install -y \
        tini \
        wget

RUN wget -O /tmp/airspy_adsb.tgz ${AIRSPY_ADSB_URL} && tar zxvf /tmp/airspy_adsb.tgz && mv airspy_adsb /usr/local/bin
COPY --from=builder /usr/local/bin/airspy_adsb /usr/local/bin/airspy_adsb
COPY start.sh /start.sh

EXPOSE ${AIRSPY_ADSB_PORT}

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
