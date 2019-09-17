FROM alpine:3.9 as base

ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV ALTITUDE=0.0
ENV REMOTE_PI_HOSTNAME=""
ENV REMOTE_PI_USERNAME=""
ENV HEYWHATSTHAT_ID=""

ENV GIT_SOURCE="https://github.com/caiusseverus/adsbcompare.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="caiusseverus-adsbcompare" \
      org.label-schema.description="Multi-arch Docker image for caiusseverus-adsbcompare" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/caiusseverus-adsbcompare" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

RUN apk add --no-cache \
        bash \
        curl \
        gawk \
        git \
        gnuplot \
        jq \
        lua-dev \
        tini

RUN git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /root/adsbcompare
COPY polar.conf.template /root/adsbcompare/polar.conf.template

VOLUME /run/dump1090-fa
VOLUME /run/timelapse1090
VOLUME /var/www

COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN sed --in-place=.bak -e "s/bash/sh/" /root/adsbcompare/polar.sh
RUN chmod +x /root/adsbcompare/polar.sh

ENTRYPOINT ["tini", "--"]
CMD ["/start.sh"]
