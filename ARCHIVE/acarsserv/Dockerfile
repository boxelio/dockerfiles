FROM ubuntu:18.10 as base

ENV SERVER_ADDRESS=0.0.0.0
ENV SERVER_PORT=5555

ENV GIT_SOURCE="https://github.com/TLeconte/acarsserv.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="rtlamr" \
      org.label-schema.description="Multi-arch Docker container for acarsserv" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acarsserv" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

# ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
# RUN cat /etc/apk/repositories && \
#     echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories
# RUN cat /etc/apk/repositories && \
#     apk add --no-cache tini \
#         librtlsdr@testing \
#         libusb \
#         sqlite-dev

RUN apt update && apt full-upgrade -y
RUN apt install -y sqlite3 libsqlite3-dev tini

FROM base as builder

# RUN apk add --no-cache \
#         sudo git build-base cmake \
#         librtlsdr-dev@testing \
#         libgcc \
#         libusb-dev \
#         musl-dev \
#         sqlite-dev

RUN apt install -y build-essential git

RUN git clone -b ${GIT_BRANCH} ${GIT_SOURCE} && \
    cd acarsserv && \
    make -f Makefile

FROM base

COPY --from=builder acarsserv/acarsserv /usr/local/bin/acarsserv
COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
