FROM golang:1.14.7-buster as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="filecoin-lotus" \
      org.label-schema.description="Multi-arch Docker image for filecoin's Lotus node and storage miner" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/crypto/filecoin-lotus" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

FROM debian:buster AS build
RUN apt-get update && apt-get install --no-install-recommends -y cmake make gcc libc6-dev

WORKDIR /tmp
ENV TINI_VERSION 0.18.0
ADD https://github.com/krallin/tini/archive/v${TINI_VERSION}.tar.gz ./
RUN tar -xf v${TINI_VERSION}.tar.gz \
  && cmake tini-${TINI_VERSION} \
  && make

FROM base
COPY --from=build /tmp/tini /usr/local/sbin/

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
      mesa-opencl-icd \
      ocl-icd-opencl-dev \
      gcc \
      git \
      bzr \
      jq \
      make
RUN apt upgrade -y

RUN mkdir /src
RUN git clone https://github.com/filecoin-project/lotus.git /src/lotus
RUN alias systemctl="echo $1"
RUN export PATH=$PATH:/usr/lib/go-1.14/bin && cd /src/lotus && \
      make clean && \
      make all && \
      make install && \
      make install-chainwatch

COPY start.sh /start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
