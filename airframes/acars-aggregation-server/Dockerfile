FROM google/dart:2.9.3

ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_USER=acars
ENV DATABASE_PASS=boxel
ENV DATABASE_NAME=airframes

ENV JSON_INPUT_PORT=5555
ENV NATS_HOST=nats
ENV NATS_PORT=4222

ENV GIT_SOURCE="https://github.com/kevinelliott/acars-aggregation-server.git"
ENV GIT_BRANCH="last-good"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acars-aggregation-server" \
      org.label-schema.description="Multi-arch Docker container for acars-aggregation-server, an ACARS/VDL aggregation server written in Dart" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acars-aggregation-server" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update && apt install -y \
      protobuf-compiler \
      git \
      tini \
      wget \
      sudo \
      unzip

# RUN pub global activate protoc_plugin

WORKDIR /srv
COPY start.sh /start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/srv/start.sh"]
