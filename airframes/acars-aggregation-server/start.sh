#!/bin/sh

if [ -d "/srv/aggregation-server" ]
then
  cd /srv/aggregation-server && git pull
else
  git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /srv/aggregation-server
fi

cd /srv/aggregation-server
./build.sh

/srv/aggregation-server/bin/server.exe \
  --database-host=${DATABASE_HOST} \
  --database-port=${DATABASE_PORT} \
  --database-user=${DATABASE_USER} \
  --database-pass=${DATABASE_PASS} \
  --database-name=${DATABASE_NAME} \
  --database-ssl \
  --ingest-acarsdec \
  --ingest-acarsdec-port=${INGEST_ACARSDEC_PORT} \
  --ingest-vdlm2dec \
  --ingest-vdlm2dec-port=${INGEST_VDLM2DEC_PORT} \
  --ingest-jaero-c-adsc \
  --ingest-jaero-c-adsc-port=${INGEST_JAERO_C_ADSC_PORT} \
  --nats-host=${NATS_HOST} \
  --nats-port=${NATS_PORT} \
  --verbose
