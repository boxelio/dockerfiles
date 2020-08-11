FROM alpine:3.10

ENV GIT_SOURCE=https://github.com/NuSkooler/enigma-bbs.git
ENV GIT_BRANCH=0.0.10-alpha

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="bbs-enigma" \
      org.label-schema.description="Multi-arch Docker image for Enigma BBS" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/bbs-enigma" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apk add lrzsz --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --no-cache \
    bash \
    build-base \
    curl \
    git \
    nodejs \
    nodejs-npm \
    p7zip \
    python2 \
    openssl-dev \
    unarj \
    unrar

RUN curl -o sexyz20.zip ftp://vert.synchro.net/Synchronet/sexyz20.zip

RUN npm install -g pm2

RUN git clone ${GIT_SOURCE} --depth 1 --branch ${GIT_BRANCH}
RUN cd /enigma-bbs && npm install --only=production

VOLUME /enigma-bbs/art
VOLUME /enigma-bbs/config
VOLUME /enigma-bbs/db
VOLUME /enigma-bbs/filebase
VOLUME /enigma-bbs/logs
VOLUME /enigma-bbs/mods
VOLUME /mail

EXPOSE 8888

WORKDIR /enigma-bbs

# # copy base config
# COPY config/* /enigma-bbs/misc/

# # set up config init script
# COPY scripts/enigma_config.sh /enigma-bbs/misc/enigma_config.sh
# RUN chmod +x /enigma-bbs/misc/enigma_config.sh

ENTRYPOINT ["/bin/bash", "-c", "cd /enigma-bbs && exec pm2-docker ./main.js"]
