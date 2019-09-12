#!/bin/sh

BASE_PATH="~/Cloud/Dropbox/work/boxel/dockerfiles"
SCRIPT_PATH="${BASE_PATH}/support/scripts"

cd ${BASE_PATH}
${SCRIPT_PATH}/build_and_push.sh gnuradio-pybombs-base Dockerfile boxel/gnuradio-pybombs-base:latest
${SCRIPT_PATH}/build_and_push.sh acarsdec Dockerfile boxel/acarsdec:latest
${SCRIPT_PATH}/build_and_push.sh chrony Dockerfile boxel/chrony:latest
${SCRIPT_PATH}/build_and_push.sh direwolf Dockerfile boxel/direwolf:latest
${SCRIPT_PATH}/build_and_push.sh feeder-adsb-exchange Dockerfile boxel/feeder-adsb-exchange:latest
${SCRIPT_PATH}/build_and_push.sh flightaware-dump978 Dockerfile boxel/flightaware-dump978:latest
${SCRIPT_PATH}/build_and_push.sh flightaware-dump1090 Dockerfile boxel/flightaware-dump1090:latest
${SCRIPT_PATH}/build_and_push.sh flightaware-skyview1090 Dockerfile boxel/flightaware-skyview1090:latest
${SCRIPT_PATH}/build_and_push.sh mutability-mlat-client Dockerfile boxel/mutability-mlat-client:latest
${SCRIPT_PATH}/build_and_push.sh multimon-ng Dockerfile boxel/multimon-ng:latest
${SCRIPT_PATH}/build_and_push.sh npemwin Dockerfile boxel/npemwin:latest
${SCRIPT_PATH}/build_and_push.sh rtl_433 Dockerfile boxel/rtl_433:latest
${SCRIPT_PATH}/build_and_push.sh rtlamr Dockerfile boxel/rtlamr:latest
${SCRIPT_PATH}/build_and_push.sh webwspr Dockerfile boxel/webwspr:latest
${SCRIPT_PATH}/build_and_push.sh weewx Dockerfile boxel/weewx:latest
