FROM ubuntu:latest as builder
WORKDIR /srv/btc_rpc_explorer
RUN apt update && apt install git nodejs npm -y --no-install-recommends
RUN git clone https://github.com/janoside/btc-rpc-explorer.git /srv/btc_rpc_explorer
RUN pwd
RUN ls -l
RUN npm install

FROM boxel/bitcoind:latest
EXPOSE 3002
WORKDIR /srv

RUN apt update && apt install nodejs npm -y --no-install-recommends

COPY --from=builder /srv/btc_rpc_explorer /srv/btc_rpc_explorer
COPY start.sh /srv/start.sh

RUN ls -l
RUN ls -l /srv/btc_rpc_explorer

CMD /srv/start.sh
