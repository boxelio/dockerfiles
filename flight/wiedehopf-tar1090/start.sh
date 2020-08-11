#!/bin/sh

cp /var/www/tar1090/htdocs/config.orig.js /var/www/tar1090/htdocs/config.js
sed -i \
  -e 's/LATITUDE/$LATITUDE/g' \
  -e 's/LONGITUDE/$LONGITUDE/g' \
  -e 's/SITE_NAME/$SITE_NAME/g' \
  /var/www/tar1090/htdocs/config.js

/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
tail -f /var/log/lighttpd/access.log
