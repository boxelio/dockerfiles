#!/bin/sh

which fa-mlat-client
fa-mlat-client \
  --input-connect ${INPUT_CONNECT} \
  --input-type ${INPUT_TYPE} \
  --results ${RESULTS_CONNECT} \
  --results ${RESULTS_LISTEN_BEAST} \
  --results ${RESULTS_LISTEN_BASESTATION} \
  --udp-transport ${UDP_TRANSPORT}
