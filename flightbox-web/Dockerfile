FROM ruby:2.6-alpine

ENV WEB_PORT="8080"

ENV GIT_SOURCE="https://github.com/boxelio/flightbox-web.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="flightbox-web" \
      org.label-schema.description="Multi-arch Docker image for flightbox-web" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flightbox-web" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add \
        git \
        tini

RUN mkdir -p /var/www
RUN cd /var/www && git clone -b ${GIT_BRANCH} ${GIT_SOURCE} flightbox

WORKDIR /var/www/flightbox

COPY start.sh start.sh
RUN chmod +x /var/www/flightbox/start.sh

ENTRYPOINT [ "tini", "--" ]

CMD ["/var/www/flightbox/start.sh"]
