FROM debian:buster-slim

ENV CARDANO_GIT_TAG="1.19.0"

RUN apt update -y
RUN apt install -y \
  automake build-essential pkg-config libffi-dev libgmp-dev libssl-dev libtinfo-dev \
  libsystemd-dev zlib1g-dev make g++ tmux git jq wget libncursesw5 libtool autoconf

RUN apt install -y software-properties-common
RUN add-apt-repository 'deb http://downloads.haskell.org/debian buster main'
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA3CBA3FFE22B574
RUN apt update
RUN apt install -y ghc-8.6.5 cabal-install-3.2
RUN ln -s /opt/cabal/bin/cabal /usr/local/bin/cabal
RUN ln -s /opt/ghc/bin/ghc /usr/local/bin/ghc
RUN /usr/local/bin/cabal --version
RUN /usr/local/bin/ghc --version
RUN cabal update

RUN mkdir /src
RUN git clone https://github.com/input-output-hk/libsodium /src/libsodium && \
  cd /src/libsodium && \
  git checkout 66f017f1 && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install

RUN git clone https://github.com/input-output-hk/cardano-node /src/cardano-node && \
  cd /src/cardano-node && \
  git fetch --all --tags && \
  git tag && \
  git checkout tags/${CARDANO_GIT_TAG} && \
  /usr/local/bin/cabal build all
