FROM alpine:3.9 as base

ENV INPUT_CONNECT="localhost:30005"
ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV ALTITUDE=0
ENV MLAT_SERVER=""
ENV MLAT_USER=""

ENV GIT_SOURCE="https://github.com/mutability/mlat-client.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="mutability-mlat-client" \
      org.label-schema.description="Multi-arch Docker image for mutability-mlat-client" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/mutability-mlat-client" \
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
        python3-dev

FROM base as builder

RUN apk add \
        build-base \
        python3-dev \
        git

RUN git clone ${GIT_SOURCE} /root/mlat-client && \
    cd /root/mlat-client && ./setup.py install

FROM base

COPY --from=builder /usr/lib/python3.6/site-packages /usr/lib/python3.6/site-packages
COPY --from=builder /usr/bin/mlat-client /usr/bin/mlat-client
COPY --from=builder /usr/bin/fa-mlat-client /usr/bin/fa-mlat-client
COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
