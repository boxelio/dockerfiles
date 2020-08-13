#!/bin/bash

echo "=== Starting airspy_adsb..."
/usr/local/bin/airspy_adsb $AIRSPY_OPTIONS $AIRSPY_NET $AIRSPY_G $AIRSPY_GAIN $AIRSPY_M $AIRSPY_SAMPLE_RATE $AIRSPY_P $AIRSPY_PREAMBLE $AIRSPY_BIAS

echo "=== Shutting down..."
