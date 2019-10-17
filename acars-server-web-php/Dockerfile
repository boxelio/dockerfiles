FROM alpine:3.10

ENV DATABASE_HOST="db"
ENV DATABASE_PORT="5432"
ENV DATABASE_USER="postgres"
ENV DATABASE_PASS=""
ENV WEB_PORT="80"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acars-server-web-php" \
      org.label-schema.description="Multi-arch Docker image for a PHP-based web UI for acars-server" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acars-server-web-php" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add \
        lighttpd \
        fcgi \
        php7-common \
        php7-cgi \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-gd \
        php7-gettext \
        php7-iconv \
        php7-json \
        php7-mcrypt \
        php7-pdo \
        php7-pdo_pgsql \
        php7-pgsql \
        php7-posix \
        php7-soap \
        php7-xml \
        php7-xmlrpc \
        tini

RUN cat /etc/lighttpd/lighttpd.conf && \
    lighttpd -t -f /etc/lighttpd/lighttpd.conf && \
    echo "Lighttpd is running..." > /var/www/localhost/htdocs/index.html && \
    addgroup www && \
    adduser -D -H -s /sbin/nologin -G www www

RUN echo "include \"mod_fastcgi.conf\"" >> /etc/lighttpd/lighttpd.conf
RUN sed --in-place=.bak -e "s/php-cgi/php-cgi7/" /etc/lighttpd/mod_fastcgi.conf
RUN mkdir -p /run/lighttpd && chmod 777 /run/lighttpd

COPY web/* /var/www/localhost/htdocs/

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "tini", "--" ]

CMD ["/start.sh"]
