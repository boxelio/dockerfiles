#!/bin/sh

PGPASSWORD=${DATABASE_PASS} createdb -U ${DATABASE_USER} -h ${DATABASE_HOST} -p ${DATABASE_PORT} ${DATABASE_NAME}
PGPASSWORD=${DATABASE_PASS} psql -U ${DATABASE_USER} -h ${DATABASE_HOST} -p ${DATABASE_PORT} ${DATABASE_NAME} < /root/go/src/acars-server/create-db.sql

/root/go/bin/acars-server -database-host=${DATABASE_HOST} -database-port=${DATABASE_PORT} -database-user=${DATABASE_USER} -database-password=${DATABASE_PASS} -database-name=${DATABASE_NAME} -json-listen-ip=0.0.0.0 -json-listen-port=5555
