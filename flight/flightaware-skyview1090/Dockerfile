FROM alpine:3.9 as base

ENV LATITUDE=0.0
ENV LONGITUDE=0.0
ENV WEB_PORT="80"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="flightaware-dump1090" \
      org.label-schema.description="Multi-arch Docker image for flightaware-dump1090" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/flightaware-dump1090" \
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

RUN git clone "https://github.com/flightaware/dump1090.git" /root/dump1090
    
FROM base

RUN mkdir -p /var/www/dump1090-fa/htdocs
COPY --from=builder /root/dump1090/public_html /var/www/dump1090-fa/htdocs/
COPY --from=builder /root/dump1090/debian/lighttpd/* /etc/lighttpd/conf.available/
RUN sed --in-place=.bak  -e "s/\/usr\/share\/dump1090-fa\/html\//\/var\/www\/dump1090-fa\/htdocs\//" /etc/lighttpd/conf.available/89-dump1090-fa.conf
RUN sed --in-place=.bak -e "s/#    \"mod_alias\"/    \"mod_alias\"/" /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/#    \"mod_compress\"/    \"mod_compress\"/" /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/#    \"mod_redirect\"/    \"mod_redirect\"/" /etc/lighttpd/lighttpd.conf
# RUN echo "compress.cache-dir          = \"/var/cache/lighttpd/compress/\" \
# compress.filetype           = ( \"application/javascript\", \"text/css\", \"text/html\", \"text/plain\" ) \
# " >> /etc/lighttpd/lighttpd.conf

RUN mkdir -p /etc/lighttpd/conf.enabled
RUN ln -s /etc/lighttpd/conf.available/88-dump1090-fa-statcache.conf /etc/lighttpd/conf.enabled
RUN ln -s /etc/lighttpd/conf.available/89-dump1090-fa.conf /etc/lighttpd/conf.enabled
RUN echo "include \"/etc/lighttpd/conf.enabled/88-dump1090-fa-statcache.conf\"" >> /etc/lighttpd/lighttpd.conf
RUN echo "include \"/etc/lighttpd/conf.enabled/89-dump1090-fa.conf\"" >> /etc/lighttpd/lighttpd.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /run/dump1090-fa

EXPOSE ${WEB_PORT}

ENTRYPOINT ["tini", "--"]
CMD ["/start.sh"]
