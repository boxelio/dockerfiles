docker rm bitcoind-node-with-web
docker pull boxel/bitcoind_with_web
docker volume create --name=bitcoind-data
docker run -v bitcoind-data:/srv/bitcoin --name=bitcoind-node-with-web -d \
     -p 3002:3002 \
     -p 8333:8333 \
     -p 127.0.0.1:8332:8332 \
     boxel/bitcoind_with_web
