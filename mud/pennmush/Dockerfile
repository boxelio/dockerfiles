FROM alpine:3.14

ENV GITHUB_TAG 188p0
ENV GITHUB_TARBALL_URL https://github.com/pennmush/pennmush/archive/refs/tags/${GITHUB_TAG}.tar.gz
ENV TARBALL_FILENAME pennmush-${GITHUB_TAG}.tar.gz
ENV SOURCE_DIR /src
ENV APP_SOURCE_DIR ${SOURCE_DIR}/pennmush-${GITHUB_TAG}

RUN mkdir ${SOURCE_DIR}
RUN apk update
RUN apk add build-base perl zlib-dev openssl-dev

WORKDIR ${SOURCE_DIR}
RUN wget ${GITHUB_TARBALL_URL} -O ${SOURCE_DIR}/${TARBALL_FILENAME}
RUN tar zxvf ${SOURCE_DIR}/${TARBALL_FILENAME}

WORKDIR ${APP_SOURCE_DIR}
RUN ./configure
RUN ./configure --help
RUN make update
RUN make install
