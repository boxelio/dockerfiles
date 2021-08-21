#!/bin/sh

echo "Starting lighttpd..."
lighttpd -f /etc/lighttpd/lighttpd.conf
echo

echo "Starting planefence..."
${SHARE_PATH}/start_planefence
