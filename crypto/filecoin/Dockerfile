FROM ubuntu:latest as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="airspy_adsb" \
      org.label-schema.description="Multi-arch Docker image for filecoin's Lotus node and storage miner" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/crypto/filecoin-lotus" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update

RUN apt-get install --no-install-recommends -y \
      ca-certificates \
      curl \
      file \
      gnupg

RUN DEBIAN_FRONTEND=noninteractive apt install -y \
      mesa-opencl-icd \
      ocl-icd-opencl-dev \
      gcc \
      git \
      bzr \
      jq \
      make \
      golang
RUN apt upgrade -y

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -s https://raw.githubusercontent.com/mikenye/deploy-s6-overlay/master/deploy-s6-overlay.sh | sh

RUN mkdir /src
RUN git clone https://github.com/filecoin-project/lotus.git /src/lotus
RUN cd /src/lotus && \
      make clean && \
      make all && \
      make install && \
      make install-chainwatch && \
      make install-all-services

ENTRYPOINT ["/init"]
