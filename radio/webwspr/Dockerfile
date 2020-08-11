FROM alpine:3.9 as base

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="webwspr" \
      org.label-schema.description="Multi-arch Docker container for webwspr" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/webwspr" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

FROM base

RUN apk add --no-cache \
    alsa-lib alsa-lib-dev fftw-dev gd gd-dev apache2 libsndfile libsndfile-dev \
    zlib-dev jpeg-dev freetype-dev musl php git build-base 

RUN git clone https://github.com/dj0abr/WebWSPR.git /tmp/webwspr && \
    cd /tmp/webwspr && \
    sed -i.old '1s;^;#include <fcntl.h>;' cat.c && \
    make

RUN cp /tmp/webwspr/wsprtk /usr/local/bin/wsprtk

ENTRYPOINT ["tini", "--"]

CMD ["/usr/local/bin/wsprtk"]
