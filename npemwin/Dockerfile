FROM alpine:3.9 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="npemwin" \
      org.label-schema.description="Multi-arch Docker container for npemwin" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/npemwin" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ENV SOURCE_TGZ="https://bitbucket.org/noaaport/npemwin/get/master.tar.gz"

RUN apk add --virtual build-dependencies \
        build-base \
        gcc \
        wget

RUN apk add --no-cache \
        dumb-init tcl tcl-dev gnuplot unzip

RUN mkdir -p /usr/local/etc/npemwin
RUN mkdir -p /usr/local/libexec/npemwin
RUN mkdir -p /usr/local/libexec/npemwin/tclhttpd/dist
RUN mkdir -p /usr/local/man
RUN mkdir -p /usr/local/share/doc/npemwin
RUN mkdir -p /usr/local/sbin

RUN wget ${SOURCE_TGZ}
RUN mkdir source && tar x -zv -f master.tar.gz -C source
RUN cd source/noaaport-npemwin* && mkdir tclmetar/tclmetar/examples && ls -l && \
    ./configure.sh && make all && make install

COPY servers.conf /usr/local/etc/npemwin/servers.conf

VOLUME [ "/var/npemwin" ]
VOLUME [ "/usr/local/etc/npemwin" ]
VOLUME [ "/usr/local/libexec/npemwin/" ]

EXPOSE 8016

USER noaaport:noaaport

ENTRYPOINT ["dumb-init", "--"]

CMD ["/usr/local/sbin/npemwind","-D","-D"]
