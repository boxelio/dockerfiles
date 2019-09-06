FROM alpine:3.9

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="gnuradio-pybombs-base" \
      org.label-schema.description="Multi-arch Docker base image for GNU Radio's PyBOMBS" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/gnuradio-pybombs-base" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache \
    python2 python2-dev py2-pip git build-base automake autoconf

RUN git clone https://github.com/gnuradio/pybombs -b master && \
    cd pybombs && \
    python setup.py install

RUN pybombs -v prefix init /pybombs
RUN pybombs -v recipes add gr-recipes git+https://github.com/gnuradio/gr-recipes.git && \
    pybombs -v recipes add gr-etcetera git+https://github.com/gnuradio/gr-etcetera.git
