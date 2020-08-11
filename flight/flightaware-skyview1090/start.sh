#!/bin/sh

/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
tail -f /var/log/lighttpd/access.log
