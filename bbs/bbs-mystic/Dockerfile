FROM alpine:3.10 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="bbs-mystic" \
      org.label-schema.description="Multi-arch Docker image for Mystic BBS" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/bbs-mystic" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache \
    curl \
    unrar

RUN mkdir /mystic && mkdir /mysticdata

COPY install.sh /tmp/install.sh
RUN sh /tmp/install.sh
