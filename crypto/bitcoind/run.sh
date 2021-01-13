#!/bin/sh

docker stop bitcoind-node
docker rm bitcoind-node
docker pull boxel/bitcoind
docker volume create --name=bitcoind-data
docker run -v bitcoind-data:/srv/bitcoin --name=bitcoind-node -d \
     -p 8332:8332 \
     -p 8333:8333 \
     boxel/bitcoind -rest -rpcbind=0.0.0.0:8332 -server
