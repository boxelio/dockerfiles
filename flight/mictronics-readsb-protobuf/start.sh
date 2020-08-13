#!/bin/bash

if [ "$USE_AIRSPY" = 'true' ]; then
  echo "=== Starting airspy_adsb..."
  /usr/local/bin/airspy_adsb $AIRSPY_OPTIONS $AIRSPY_NET $AIRSPY_G $AIRSPY_GAIN $AIRSPY_M $AIRSPY_SAMPLE_RATE $AIRSPY_P $AIRSPY_PREAMBLE $AIRSPY_BIAS &
fi

echo "=== Starting readsb-protobuf..."
/usr/local/bin/readsb $READSB_RECEIVER_OPTIONS $READSB_DECODER_OPTIONS $READSB_NET_OPTIONS $READSB_JSON_OPTIONS --lat $LATITUDE --lon $LONGITUDE --write-json /run/readsb --quiet

echo "=== Shutting down..."
