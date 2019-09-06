#!/bin/sh
exec /usr/local/bin/rtl_433 $@ | \
     /usr/bin/socat STDIN TCP-LISTEN:${PORT:-9433},reuseaddr,fork
