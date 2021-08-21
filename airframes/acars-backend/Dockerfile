FROM mhart/alpine-node:12

ENV APP_HOST=0.0.0.0
ENV APP_PORT=80
ENV CERTBOT_EMAIL=kevin@phunc.com
ENV FQDN=app.airframes.io
ENV NATS_HOST=nats
ENV NATS_PORT=4222

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acars-backend" \
      org.label-schema.description="Multi-arch Docker container for acars-backend" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/airframes/acars-backend" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache \
      certbot \
      sudo \
      tini

COPY git-source /acars-backend
COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /certs

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
