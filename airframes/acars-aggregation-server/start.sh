#!/bin/sh

export PATH="$PATH:/usr/lib/dart/bin"

INGEST_OPTIONS=""

if [ "${INGEST_ACARSDEC}" = "true" ]; then
  INGEST_OPTIONS="${INGEST_OPTIONS} --ingest-acarsdec --ingest-acarsdec-port=${INGEST_ACARSDEC_PORT}"
fi
if [ "${INGEST_DUMPVDL2}" = "true" ]; then
  INGEST_OPTIONS="${INGEST_OPTIONS} --ingest-dumpvdl2 --ingest-dumpvdl2-port=${INGEST_DUMPVDL2_PORT}"
fi
if [ "${INGEST_VDLM2DEC}" = "true" ]; then
  INGEST_OPTIONS="${INGEST_OPTIONS} --ingest-vdlm2dec --ingest-vdlm2dec-port=${INGEST_VDLM2DEC_PORT}"
fi
if [ "${INGEST_JAERO_C_ACARS}" = "true" ]; then
  INGEST_OPTIONS="${INGEST_OPTIONS} --ingest-jaero-c-acars --ingest-jaero-c-acars-port=${INGEST_JAERO_C_ACARS_PORT}"
fi
if [ "${INGEST_JAERO_C_ADSC}" = "true" ]; then
  INGEST_OPTIONS="${INGEST_OPTIONS} --ingest-jaero-c-adsc --ingest-jaero-c-adsc-port=${INGEST_JAERO_C_ADSC_PORT}"
fi
if [ "${INGEST_JAERO_L_ACARS}" = "true" ]; then
  INGEST_OPTIONS="${INGEST_OPTIONS} --ingest-jaero-l-acars --ingest-jaero-l-acars-port=${INGEST_JAERO_L_ACARS_PORT}"
fi

if [ -d "/srv/aggregation-server" ]
then
  cd /srv/aggregation-server && git pull
else
  git clone -b ${GIT_BRANCH} ${GIT_SOURCE} /srv/aggregation-server
fi

mkdir /srv/aggregation-server/bin
cd /srv/aggregation-server
./build.sh

/srv/aggregation-server/bin/server.exe \
  --database-host=${DATABASE_HOST} \
  --database-port=${DATABASE_PORT} \
  --database-user=${DATABASE_USER} \
  --database-pass=${DATABASE_PASS} \
  --database-name=${DATABASE_NAME} \
  --database-ssl \
  --nats-host=${NATS_HOST} \
  --nats-port=${NATS_PORT} \
  --verbose \
  ${INGEST_OPTIONS}
