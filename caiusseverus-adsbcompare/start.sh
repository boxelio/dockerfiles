#!/bin/sh

ln -s /var/www/dump1090-fa/htdocs /usr/share/dump1090-fa/html

cp /root/adsbcompare/polar.conf.template /root/adsbcompare/polar.conf
sed --in-place=.bak -e "s/LATITUDE/${LATITUDE}/" /root/adsbcompare/polar.conf
sed --in-place=.bak -e "s/LONGITUDE/${LONGITUDE}/" /root/adsbcompare/polar.conf
sed --in-place=.bak -e "s/ALTITUDE/${ALTITUDE}/" /root/adsbcompare/polar.conf
sed --in-place=.bak -e "s/HEYWHATSTHAT_ID/${HEYWHATSTHAT_ID}/" /root/adsbcompare/polar.conf

echo CONFIG
cat /root/adsbcompare/polar.conf

echo TIMELAPSE
ls /run/timelapse1090

cd /root/adsbcompare && bash polar.sh -1
