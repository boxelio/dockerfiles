FROM ubuntu:latest

LABEL maintainer="kevin@welikeinc.com" \
      org.label-schema.name="bitcoind" \
      org.label-schema.description="Multi-arch Docker container for bitcoind" \
      org.label-schema.url="https://github.com/boxelio/dockerfiles/crypto/bitcoind" \
      org.label-schema.vcs-url="https://github.com/boxelio/dockerfiles" \
      org.label-schema.schema-version="1.0"

EXPOSE 8322 8333
VOLUME ["/srv/bitcoin"]
ENV HOME /srv/bitcoin

ARG GROUP_ID=1000
ARG USER_ID=1000
RUN mkdir /srv/bitcoin && \
    groupadd -g ${GROUP_ID} bitcoin && \
    useradd -u ${USER_ID} -g bitcoin -d /srv/bitcoin bitcoin && \
    chown bitcoin:bitcoin /srv/bitcoin

ARG VERSION=0.20.1
ARG ARCH=x86_64
ARG BITCOIN_CORE_SIGNATURE=01EA5486DE18A882D4C2684590C8019E36C2E964

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM."

RUN apt update && \
    apt install -y --no-install-recommends \
      ca-certificates \
      gosu \
      wget \
      gnupg && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp && \
    wget --no-check-certificate https://bitcoincore.org/bin/bitcoin-core-${VERSION}/SHA256SUMS.asc && \
    gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys ${BITCOIN_CORE_SIGNATURE} && \
    gpg --verify SHA256SUMS.asc && \
    grep bitcoin-${VERSION}-${ARCH}-linux-gnu.tar.gz SHA256SUMS.asc > SHA25SUM

RUN ls /tmp && cat /tmp/SHA25SUM && wget --no-check-certificate https://bitcoincore.org/bin/bitcoin-core-0.20.1/bitcoin-${VERSION}-${ARCH}-linux-gnu.tar.gz && \
    sha256sum -c /tmp/SHA25SUM && \
    tar -xzvf bitcoin-${VERSION}-${ARCH}-linux-gnu.tar.gz -C /opt && \
    ln -sv bitcoin-${VERSION} /opt/bitcoin && \
    ln -sv /opt/bitcoin/bin/* /usr/local/bin

ADD ./bin entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
WORKDIR /srv/bitcoin
CMD ["btc_oneshot"]
