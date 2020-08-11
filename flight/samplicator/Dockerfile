FROM alpine:3.10 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="samplicator" \
      org.label-schema.description="Multi-arch Docker container for samplicator" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flight/samplicator" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ENV DEBUG_LEVEL="2"
ENV LISTEN_PORT="5555"
ENV DESTINATIONS="feed.example1.org/5555 feed.example2.org/5555"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories
RUN cat /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tini

FROM base as builder

RUN apk add --no-cache \
    sudo git build-base automake autoconf

RUN git clone "https://github.com/sleinen/samplicator.git" && \
    cd samplicator && \
    sh autogen.sh && \
    ./configure && \
    make && \
    sudo make install

FROM base

COPY --from=builder /usr/local/bin/samplicate /srv/samplicate
WORKDIR /srv
COPY start.sh start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/srv/start.sh"]
