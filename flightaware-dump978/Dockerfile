FROM alpine:3.10 as base

ENV BRANCH_SOAPYSDR=soapy-sdr-0.5.4

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="flightaware-dump978" \
      org.label-schema.description="Multi-arch Docker image for flightaware-dump978" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flightaware-dump978" \
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
        libusb-dev \
        boost-dev boost-system boost-program_options boost-regex boost-filesystem

RUN apk add swig py-numpy && \
    git clone -b ${BRANCH_SOAPYSDR} https://github.com/pothosware/SoapySDR.git /root/SoapySDR && \
    mkdir -p /root/SoapySDR/build && \
    cd /root/SoapySDR/build && \
    cmake -Wno-dev .. && \
    make -j && \
    make install

RUN git clone "https://github.com/flightaware/dump978.git" /root/dump978 && \
    cd /root/dump978 && make && make faup978
    
FROM base

COPY --from=builder /root/dump978/dump978-fa /usr/local/bin/dump978-fa
COPY --from=builder /root/dump978/skyview978 /usr/local/bin/skyview978
COPY --from=builder /root/dump978/faup978 /usr/local/bin/faup978
COPY start.sh /root/start.sh

EXPOSE 30978

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
