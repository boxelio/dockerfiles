FROM alpine:3.9 as base

ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV WEB_PORT="8082"

ENV GIT_SOURCE="https://github.com/wiedehopf/timelapse1090.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="wiedehopf-timelapse1090" \
      org.label-schema.description="Multi-arch Docker image for wiedehopf-timelapse1090" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/wiedehopf-timelapse1090" \
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
        libusb \
        lighttpd 

RUN cat /etc/lighttpd/lighttpd.conf && \
    lighttpd -t -f /etc/lighttpd/lighttpd.conf && \
    echo "Lighttpd is running..." > /var/www/localhost/htdocs/index.html && \
    addgroup www && \
    adduser -D -H -s /sbin/nologin -G www www

FROM base as builder

RUN apk add --no-cache \
        sudo git

RUN git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /tmp/timelapse1090
    
FROM base

RUN mkdir -p /var/www/timelapse1090/htdocs
COPY --from=builder /tmp/timelapse1090/html /var/www/timelapse1090/htdocs/
COPY --from=builder /tmp/timelapse1090/88-timelapse1090.conf /etc/lighttpd/conf.available/
RUN sed --in-place=.bak  -e "s/\/usr\/local\/share\/timelapse1090\/html\//\/var\/www\/timelapse1090\/htdocs\//" /etc/lighttpd/conf.available/88-timelapse1090.conf
RUN sed --in-place=.bak -e "s/#    \"mod_alias\"/    \"mod_alias\"/" /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/#    \"mod_compress\"/    \"mod_compress\"/" /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/#    \"mod_redirect\"/    \"mod_redirect\"/" /etc/lighttpd/lighttpd.conf
RUN echo "server.port=${WEB_PORT}" >> /etc/lighttpd/lighttpd.conf

RUN mkdir -p /etc/lighttpd/conf.enabled
RUN ln -s /etc/lighttpd/conf.available/88-timelapse1090.conf /etc/lighttpd/conf.enabled
RUN echo "include \"/etc/lighttpd/conf.enabled/88-timelapse1090.conf\"" >> /etc/lighttpd/lighttpd.conf

RUN mkdir -p /etc/default
COPY --from=builder /tmp/timelapse1090/default /etc/default/timelapse1090
COPY --from=builder /tmp/timelapse1090/timelapse1090.sh /timelapse1090.sh
RUN sed --in-place=.bak -e "s/bash/sh/" /timelapse1090.sh
RUN chmod +x /timelapse1090.sh

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /run/dump1090-fa
VOLUME /run/timelapse1090

EXPOSE ${WEB_PORT}

ENTRYPOINT ["tini", "--"]
CMD ["/start.sh"]
