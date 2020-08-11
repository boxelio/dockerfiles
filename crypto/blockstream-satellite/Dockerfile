FROM ubuntu:18.10

ENV FREQUENCY_IN_HZ=1276150000

ENV GIT_SOURCE="https://github.com/bitcoinfibre/bitcoinfibre.git"
ENV GIT_BRANCH="master"

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="blockstream-satellite" \
      org.label-schema.description="Multi-arch Docker container for blockstream-satellite" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/blockstream-satellite" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt-get update
RUN apt-get install -y software-properties-common git

RUN add-apt-repository ppa:blockstream/satellite && \
    apt-get update

RUN apt-get install -y satellite tini

RUN git clone ${GIT_SOURCE} /root/bitcoinfibre
RUN cd /root/bitcoinfibre && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

COPY start.sh /start.sh

ENTRYPOINT [ "tini", "--" ]

CMD ["/start.sh"]
