FROM alpine:3.9 as base

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories && \
    cat /etc/apk/repositories && \
    apk add --no-cache \
        tini \
        rtl-sdr@testing \
        musl libgcc libstdc++

FROM base as builder

RUN apk add --no-cache \
    git build-base qt-dev

COPY multimon-ng.pro /tmp

RUN git clone https://github.com/EliasOenal/multimon-ng.git /tmp/multimon-ng && \
    cd /tmp/multimon-ng && \
    mv /tmp/multimon-ng.pro . && \
    mkdir build && cd build && \
    qmake ../multimon-ng.pro PREFIX=/usr/local && \
    make && make install && \
    find /usr/local/bin -type f -exec strip -p --strip-debug {} \;

FROM base

COPY --from=builder /usr/local/bin/multimon-ng /usr/local/bin/multimon-ng

ENTRYPOINT ["tini", "--"]

CMD ["/usr/local/bin/multimon-ng"]

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="multimon-ng" \
      org.label-schema.description="Multi-arch Docker container for multimon-ng" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/multimon-ng" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"
