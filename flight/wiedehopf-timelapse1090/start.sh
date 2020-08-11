#!/bin/sh

/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
/timelapse1090.sh &
tail -f /var/log/lighttpd/access.log
