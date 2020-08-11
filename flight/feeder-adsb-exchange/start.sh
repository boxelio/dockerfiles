#!/bin/sh
while sleep 30
do
	if ping -q -c 2 -W 5 ${ADSB_EXCHANGE_SERVER} >/dev/null 2>&1
	then
		echo Connected to ${ADSB_EXCHANGE_SERVER}:$RECEIVER_PORT
		/usr/bin/socat -x -u TCP:${FEED_SOURCE_HOST}:${FEED_SOURCE_PORT} TCP:${ADSB_EXCHANGE_SERVER}:${ADSB_EXCHANGE_PORT}
		echo Disconnected
	else
		echo Unable to connect to ${ADSB_EXCHANGE_SERVER}, trying again in 30 seconds!
	fi
done
