FROM boxel/gnuradio-pybombs-base:latest as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="pybombs-gr-gsm" \
      org.label-schema.description="Multi-arch Docker image for gr-gsm" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/pybombs-gr-gsm" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache \
    sudo libevent-dev gnutls-dev lapack-dev gfortran \
    libzmq cairo-dev libxml2-dev

RUN pybombs install gr-gsm
