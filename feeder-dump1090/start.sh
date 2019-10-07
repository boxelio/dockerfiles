#!/bin/sh
while sleep 30
do
	if ping -q -c 2 -W 5 $FEED_DESTINATION_HOST >/dev/null 2>&1
	then
		echo Piping $FEED_SOURCE_HOST:$FEED_SOURCE_PORT to $FEED_DESTINATION_HOST:$FEED_DESTINATION_PORT
		/usr/bin/socat -u TCP:$FEED_SOURCE_HOST:$FEED_SOURCE_PORT TCP:$FEED_DESTINATION_HOST:$FEED_DESTINATION_PORT
		echo Disconnected
	else
		echo Unable to connect to $FEED_DESTINATION_HOST, trying again in 30 seconds!
	fi
done
