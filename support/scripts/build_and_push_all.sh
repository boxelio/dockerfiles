#!/bin/sh

BASE_PATH="~/Cloud/Dropbox/work/boxel/dockerfiles"
SCRIPT_PATH="${BASE_PATH}/support/scripts"

cd ${BASE_PATH}
${SCRIPT_PATH}/build_and_push.sh acarsdec
${SCRIPT_PATH}/build_and_push.sh bbs-enigma
${SCRIPT_PATH}/build_and_push.sh bbs-mystic
${SCRIPT_PATH}/build_and_push.sh bbs-synchronet
${SCRIPT_PATH}/build_and_push.sh caiusseverus-adsbcompare
${SCRIPT_PATH}/build_and_push.sh chrony
${SCRIPT_PATH}/build_and_push.sh direwolf
${SCRIPT_PATH}/build_and_push.sh feeder-adsb-exchange
${SCRIPT_PATH}/build_and_push.sh flightaware-dump978
${SCRIPT_PATH}/build_and_push.sh flightaware-dump1090
${SCRIPT_PATH}/build_and_push.sh flightaware-skyview1090
${SCRIPT_PATH}/build_and_push.sh flightbox-web
${SCRIPT_PATH}/build_and_push.sh gnuradio-pybombs-base
${SCRIPT_PATH}/build_and_push.sh mutability-mlat-client
${SCRIPT_PATH}/build_and_push.sh multimon-ng
${SCRIPT_PATH}/build_and_push.sh npemwin
${SCRIPT_PATH}/build_and_push.sh rtl_433
${SCRIPT_PATH}/build_and_push.sh rtlamr
${SCRIPT_PATH}/build_and_push.sh virtual-radar-server
${SCRIPT_PATH}/build_and_push.sh webwspr
${SCRIPT_PATH}/build_and_push.sh weewx
${SCRIPT_PATH}/build_and_push.sh wiedehopf-tar1090
${SCRIPT_PATH}/build_and_push.sh wiedehopf-timelapse1090
