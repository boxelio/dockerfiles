#!/bin/sh

docker stop ethereum-node
docker rm ethereum-node
docker run -d --name ethereum-node \
    -v $HOME/.ethereum:/root \
    -p 8545:8545 \
    -p 8546:8546 \
    -p 30303:30303 \
    -p 30304:30304 \
    ethereum/client-go \
      --rpc --rpcaddr 0.0.0.0 --rpcport 8545 --rpcapi eth,web3,debug,txpool,net,shh,db,admin,debug,personal \
      --ws --wsapi eth,web3,debug,txpool,net,shh,db,admin,debug \
      --gcmode full --metrics
