FROM alpine:3.12 as base

ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV SITE_NAME="tar1090"
ENV WEB_PORT="8081"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="wiedehopf-tar1090" \
      org.label-schema.description="Multi-arch Docker image for wiedehopf-tar1090" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/wiedehopf-tar1090" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN cat /etc/apk/repositories && \
    apk add --no-cache tini \
        librtlsdr \
        libusb \
        lighttpd

RUN cat /etc/lighttpd/lighttpd.conf && \
    lighttpd -t -f /etc/lighttpd/lighttpd.conf && \
    addgroup www && \
    adduser -D -H -s /sbin/nologin -G www www

FROM base as builder

RUN apk add --no-cache \
        sudo git

RUN git clone "https://github.com/wiedehopf/tar1090.git" /tmp/tar1090

FROM base

RUN mkdir -p /var/www/tar1090/htdocs
COPY --from=builder /tmp/tar1090/html /var/www/tar1090/htdocs/
COPY --from=builder /tmp/tar1090/88-tar1090.conf /etc/lighttpd/conf.available/
RUN sed --in-place=.bak  -e "s/HTMLPATH/\/var\/www\/tar1090\/htdocs/g" /etc/lighttpd/conf.available/88-tar1090.conf
RUN sed --in-place=.bak  -e "s/\/INSTANCE//g" /etc/lighttpd/conf.available/88-tar1090.conf
RUN sed --in-place=.bak -e "s/#    \"mod_alias\"/    \"mod_alias\"/" /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/#    \"mod_compress\"/    \"mod_compress\"/" /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/#    \"mod_redirect\"/    \"mod_redirect\"/" /etc/lighttpd/lighttpd.conf
RUN echo "server.port=${WEB_PORT}" >> /etc/lighttpd/lighttpd.conf
# RUN echo "compress.cache-dir          = \"/var/cache/lighttpd/compress/\" \
# compress.filetype           = ( \"application/javascript\", \"text/css\", \"text/html\", \"text/plain\" ) \
# " >> /etc/lighttpd/lighttpd.conf

RUN mkdir -p /etc/lighttpd/conf.enabled
RUN ln -s /etc/lighttpd/conf.available/88-tar1090.conf /etc/lighttpd/conf.enabled
RUN echo "include \"/etc/lighttpd/conf.enabled/88-tar1090.conf\"" >> /etc/lighttpd/lighttpd.conf

COPY config.js /var/www/tar1090/htdocs/config.orig.js
COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /run/dump1090-fa

EXPOSE ${WEB_PORT}

ENTRYPOINT ["tini", "--"]
CMD ["/start.sh"]
