FROM mhart/alpine-node:12

ENV APP_HOST=0.0.0.0
ENV APP_PORT=5582
ENV BACKEND_HOST=acars-backend
ENV BACKEND_PORT=5581

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="acars-frontend" \
      org.label-schema.description="Multi-arch Docker container for acars-frontend" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/acars-frontend" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add --no-cache \
      git \
      sudo \
      tini

RUN git clone "https://github.com/kevinelliott/acars-frontend.git" /acars-frontend && \
    cd acars-frontend && \
    yarn install

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["tini", "--", "/bin/sh", "/start.sh"]
