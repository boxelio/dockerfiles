#!/bin/sh

HTMLPATH="\/var\/www\/tar1090\/htdocs"
INSTANCE="tar1090"
SERVICE="dump1090-fa"
SOURCE_DIR="\/run\/$SERVICE"

cp /var/www/tar1090/htdocs/config.orig.js /var/www/tar1090/htdocs/config.js
sed -i \
  -e "s/LATITUDE/$LATITUDE/g" \
  -e "s/LONGITUDE/$LONGITUDE/g" \
  -e "s/SITE_NAME/$SITE_NAME/g" \
  /var/www/tar1090/htdocs/config.js

sed -i \
  -e "s/HTMLPATH/$HTMLPATH/g" \
  -e "s/INSTANCE/$INSTANCE/g" \
  -e "s/SERVICE/$SERVICE/g" \
  -e "s/SOURCE_DIR/$SOURCE_DIR/g" \
  /etc/lighttpd/conf.enabled/88-tar1090.conf

/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
tail -f /var/log/lighttpd/access.log
