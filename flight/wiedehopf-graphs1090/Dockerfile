FROM debian:stable-slim as base

# GENERAL
ENV GIT_SOURCE="git://github.com/wiedehopf/graphs1090.git"
ENV GIT_BRANCH="master"
ENV SRC_PATH="/src/graphs1090"
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="readsb" \
      org.label-schema.description="Multi-arch Docker image for wiedehopf's graphs1090, graphing for dump1090" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/wiedehopf-graphs1090" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update
RUN apt install -y \
  collectd-core \
  curl \
  file \
  gcc \
  git \
  gnupg2 \
  libc-dev \
  libpython2.7 \
  libpython3.7-minimal \
  make \
  ncurses-dev \
  nginx-light \
  procps \
  python3-minimal \
  rrdtool

RUN mkdir /src && mkdir -p /usr/share/graphs1090
RUN git clone -b ${GIT_BRANCH} --depth 1 ${GIT_SOURCE} ${SRC_PATH}
RUN cp -v ${SRC_PATH}/dump1090.db /usr/share/graphs1090/
RUN cp -v ${SRC_PATH}/dump1090.py /usr/share/graphs1090/
RUN cp -v ${SRC_PATH}/system_stats.py /usr/share/graphs1090/
RUN cp -v ${SRC_PATH}/LICENSE /usr/share/graphs1090/
RUN cp -v ${SRC_PATH}/*.sh /usr/share/graphs1090/
RUN cp -v ${SRC_PATH}/collectd.conf /etc/collectd/collectd.conf
RUN cp -v ${SRC_PATH}/nginx-graphs1090.conf /usr/share/graphs1090/
RUN chmod -v a+x /usr/share/graphs1090/*.sh
RUN sed -i -e 's/XFF.*/XFF 0.8/' /etc/collectd/collectd.conf
RUN sed -i -e 's/skyview978/skyaware978/' /etc/collectd/collectd.conf
RUN cp -rv ${SRC_PATH}/html /usr/share/graphs1090/
RUN sed -i -e "s/__cache_version__/$(date +%s | tail -c5)/g" /usr/share/graphs1090/html/index.html
RUN mkdir -p /usr/share/graphs1090/data-symlink/data && \
  mkdir -p /var/lib/collectd/rrd/localhost/dump1090-localhost && \
  mkdir -p /run/graphs1090

# RUN bash -c "$(wget -q -O - https://raw.githubusercontent.com/wiedehopf/graphs1090/master/install.sh)"

COPY etc/ /etc/

RUN apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  file \
  gnupg
RUN curl -s https://raw.githubusercontent.com/mikenye/deploy-s6-overlay/master/deploy-s6-overlay.sh | bash -x
RUN apt-get remove -y \
      ca-certificates \
      curl \
      file \
      gnupg

EXPOSE 80

VOLUME ["/var/lib/collectd/rrd"]

ENTRYPOINT ["/init"]
