FROM alpine:3.10 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="rtlamr" \
      org.label-schema.description="Multi-arch Docker container for rtlamr" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/rtlamr" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

ARG ALPINE_MIRROR="http://dl-cdn.alpinelinux.org/alpine"
RUN cat /etc/apk/repositories && \
    echo "@testing ${ALPINE_MIRROR}/edge/testing" >> /etc/apk/repositories
RUN cat /etc/apk/repositories && \
    apk add --no-cache tini \
        librtlsdr@testing \
        libusb

FROM base as builder

RUN apk add --no-cache \
        git build-base cmake \
        librtlsdr-dev@testing \
        libc-dev \
        libusb-dev \
        go

RUN go get github.com/bemasher/rtlamr && ls -l /root/go/bin

FROM base

COPY --from=builder /root/go/bin/rtlamr /usr/local/bin/rtlamr

ENTRYPOINT ["tini", "--"]

CMD ["/usr/local/bin/rtlamr"]
