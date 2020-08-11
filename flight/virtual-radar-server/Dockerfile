FROM alpine:3.10

ENV DEFAULT_USER=admin
ENV DEFAULT_PASSWORD=password
ENV SOURCE_BASE_URL=http://www.virtualradarserver.co.uk/Files

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="virtual-radar-server" \
      org.label-schema.description="Multi-arch Docker image for Virtual Radar Server" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/virtual-radar-server" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN cat /etc/apk/repositories && \
    apk add --no-cache \
    autoconf \
    automake \
    build-base \
    curl \
    git \
    glib-dev \
    libtool \
    pkgconf \
    tini
RUN apk add mono cairo-dev --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ARG DESTINATION_PATH=/vrs/

RUN mkdir -p ${DESTINATION_PATH}

RUN curl -o /tmp/VirtualRadar.tar.gz $SOURCE_BASE_URL/VirtualRadar.tar.gz && \
    tar -xf /tmp/VirtualRadar.tar.gz -C $DESTINATION_PATH
RUN curl -o /tmp/VirtualRadar.WebAdminPlugin.tar.gz $SOURCE_BASE_URL/VirtualRadar.WebAdminPlugin.tar.gz && \
    tar -xf /tmp/VirtualRadar.WebAdminPlugin.tar.gz -C $DESTINATION_PATH
RUN curl -o /tmp/VirtualRadar.exe.config.tar.gz $SOURCE_BASE_URL/VirtualRadar.exe.config.tar.gz && \
    tar -xf /tmp/VirtualRadar.exe.config.tar.gz -C $DESTINATION_PATH
RUN curl -o /tmp/VirtualRadar.DatabaseWriterPlugin.tar.gz $SOURCE_BASE_URL/VirtualRadar.DatabaseWriterPlugin.tar.gz && \
    tar -xf /tmp/VirtualRadar.DatabaseWriterPlugin.tar.gz -C $DESTINATION_PATH
RUN curl -o /tmp/VirtualRadar.CustomContentPlugin.tar.gz $SOURCE_BASE_URL/VirtualRadar.CustomContentPlugin.tar.gz && \
    tar -xf /tmp/VirtualRadar.CustomContentPlugin.tar.gz -C $DESTINATION_PATH

RUN git clone https://github.com/mono/libgdiplus.git /tmp/libgdiplus
RUN cd /tmp/libgdiplus && ./autogen.sh --prefix=/usr/local && make && make install

ADD flags.tar.gz /vrs/Flags
ADD silhouettes.tar.gz /vrs/Silhouettes

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

ENTRYPOINT ["tini", "--"]
CMD ["/start.sh"]
