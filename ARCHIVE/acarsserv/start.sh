#!/bin/sh

mkdir -p /data/acars

/usr/local/bin/acarsserv -b /data/acars/acars.sqb -v -j $SERVER_ADDRESS:$SERVER_PORT -s
