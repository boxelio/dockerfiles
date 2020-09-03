FROM ubuntu:bionic

ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_USER=acars
ENV DATABASE_PASS=boxel
ENV DATABASE_NAME=airframes

ENV JSON_INPUT_PORT=5555
ENV NATS_HOST=nats
ENV NATS_PORT=4222

ENV GIT_SOURCE="https://github.com/kevinelliott/acars-aggregation-server.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acars-aggregation-server" \
      org.label-schema.description="Multi-arch Docker container for acars-aggregation-server, an ACARS server written in Dart" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acars-aggregation-server" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt-get update && apt-get install -y wget sudo unzip

ARG DART_RELEASE=2.7.0-dev.2.1
RUN case "${TARGETARCH}" in \
      amd64) export DART_ARCH='x64' ;; \
      arm)   export DART_ARCH='arm' ;; \
      arm64) export DART_ARCH='arm' ;; \
    esac; \
    wget -O /tmp/dartsdk-${TARGETOS}-${DART_ARCH}-release.zip https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_RELEASE}/sdk/dartsdk-${TARGETOS}-${DART_ARCH}-release.zip && \
    cd /tmp && \
    unzip dartsdk-${TARGETOS}-${DART_ARCH}-release.zip && \
    ls -l

RUN apt-get update && apt-get install -y \
      git \
      tini

COPY start.sh /start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
