FROM alpine:3.9 as base

ENV INPUT_CONNECT="localhost:30005"
ENV INPUT_TYPE="beast"
ENV RESULTS_CONNECT="beast,connect,localhost:30104"
ENV RESULTS_LISTEN_BEAST="beast,listen,30105"
ENV RESULTS_LISTEN_BASESTATION="ext_basestation,listen,30106"
ENV UDP_TRANSPORT="70.42.6.194:5580:1607396044"

ENV GIT_SOURCE="https://github.com/mutability/mlat-client.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="flightaware-mlat-client" \
      org.label-schema.description="Multi-arch Docker image for flightaware-mlat-client" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flightaware-mlat-client" \
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

RUN git clone ${GIT_SOURCE} /mlat-client && \
    cd /mlat-client && ./setup.py install

FROM base

COPY --from=builder /usr/lib/python3.6/site-packages /usr/lib/python3.6/site-packages
COPY --from=builder /usr/bin/mlat-client /usr/bin/mlat-client
COPY --from=builder /usr/bin/fa-mlat-client /usr/bin/fa-mlat-client
COPY start.sh /root/start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/root/start.sh"]
