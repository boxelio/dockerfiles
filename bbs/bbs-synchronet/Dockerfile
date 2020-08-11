FROM alpine:3.10 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="bbs-synchronet" \
      org.label-schema.description="Multi-arch Docker image for Synchronet BBS" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/bbs-synchronet" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache \
    autoconf2.13 \
    build-base \
    mozjs60-dev \
    nspr-dev \
    patch \
    perl \
    python \
    wget \
    zip

RUN find /usr -name jsversion.h -print

RUN cd /tmp && \
    wget ftp://vert.synchro.net/Synchronet/sbbs_src.tgz && \
    wget ftp://vert.synchro.net/Synchronet/sbbs_run.tgz
RUN mkdir /sbbs
RUN cd /sbbs && \
    tar -xzf /tmp/sbbs_src.tgz && \
    tar -xzf /tmp/sbbs_run.tgz
RUN ls -l /
RUN cd /sbbs/src/sbbs3; make RELEASE=1 JSINCLUDE=/usr/include/js JSLIB=mozjs60
RUN cd /sbbs/xtrn/sbj; make
RUN cd /sbbs/exec && \
    ln -s ../src/sbbs3/gcc.*.exe.release/* . && \
    ln -s ../src/sbbs3/*/gcc.*.exe.release/* . && \
    make
