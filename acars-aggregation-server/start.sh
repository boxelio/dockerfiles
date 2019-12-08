#!/bin/sh

if [ -d "/root/go/src/acars-aggregation-server" ]
then
  cd /root/go/src/acars-aggregation-server && git pull
else
  git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /root/go/src/acars-aggregation-server
fi

go get -u github.com/buger/jsonparser
go get -u github.com/lib/pq
go get -u gopkg.in/go-gorp/gorp.v2
go get -u github.com/nats-io/nats.go
cd /root/go/src/acars-aggregation-server && go build && go install

PGPASSWORD=${DATABASE_PASS} createdb -U ${DATABASE_USER} -h ${DATABASE_HOST} -p ${DATABASE_PORT} ${DATABASE_NAME}
PGPASSWORD=${DATABASE_PASS} psql -U ${DATABASE_USER} -h ${DATABASE_HOST} -p ${DATABASE_PORT} ${DATABASE_NAME} < /root/go/src/acars-aggregation-server/create-db.sql

/root/go/bin/acars-aggregation-server \
  -database-host=${DATABASE_HOST} \
  -database-port=${DATABASE_PORT} \
  -database-user=${DATABASE_USER} \
  -database-password=${DATABASE_PASS} \
  -database-name=${DATABASE_NAME} \
  -acarsdec-json-listen-ip=${ACARSDEC_JSON_LISTEN_ADDRESS} \
  -acarsdec-json-listen-port=${ACARSDEC_JSON_LISTEN_PORT} \
  -nats-host=${NATS_HOST} \
  -nats-port=${NATS_PORT}
