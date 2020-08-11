#!/bin/sh

if [ -d "/acars_aggregation_server" ]
then
  cd /acars_aggregation_server && git pull
else
  git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /acars_aggregation_server
fi

cd /acars_aggregation_server
/tmp/dart-sdk/bin/pub get
/tmp/dart-sdk/bin/dart2native server.dart

/acars_aggregation_server/server.exe \
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
