#!/bin/sh

PGPASSWORD=${DATABASE_PASS} createdb -U ${DATABASE_USER} -h ${DATABASE_HOST} -p ${DATABASE_PORT} ${DATABASE_NAME}
PGPASSWORD=${DATABASE_PASS} psql -U ${DATABASE_USER} -h ${DATABASE_HOST} -p ${DATABASE_PORT} ${DATABASE_NAME} < /root/go/src/acars-aggregation-server/create-db.sql

/root/go/bin/acars-aggregation-server \
  -database-host=${DATABASE_HOST} \
  -database-port=${DATABASE_PORT} \
  -database-user=${DATABASE_USER} \
  -database-password=${DATABASE_PASS} \
  -database-name=${DATABASE_NAME} \
  -json-listen-ip=${ACARSDEC_JSON_LISTEN_ADDRESS} \
  -json-listen-port=${ACARSDEC_JSON_LISTEN_PORT}
