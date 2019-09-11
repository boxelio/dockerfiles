#!/bin/sh

which mlat-client
mlat-client --input-connect ${INPUT_CONNECT} --lat ${LATITUDE} --lon ${LONGITUDE} --alt ${ALTITUDE} --server ${MLAT_SERVER} --user ${MLAT_USER} --no-udp
