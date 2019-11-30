FROM ubuntu:19.04

ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_USER=acars
ENV DATABASE_PASS=boxel
ENV DATABASE_NAME=airframes

ENV ACARSDEC_JSON_LISTEN_ADDRESS=0.0.0.0
ENV ACARSDEC_JSON_LISTEN_PORT=5555
ENV NATS_HOST=nats
ENV NATS_PORT=4222

ENV GIT_SOURCE="https://github.com/kevinelliott/acars-aggregation-server.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acars-server" \
      org.label-schema.description="Multi-arch Docker container for acars-aggregation-server, an ACARS server written in Go" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acars-aggregation-server" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt-get update && apt-get full-upgrade -yq
RUN apt-get install software-properties-common -y

RUN ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get update

RUN apt-get install -yq \
      git \
      golang-go \
      postgresql-client \
      sudo \
      tini

COPY start.sh /start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
