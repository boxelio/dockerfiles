#!/bin/sh
set -e

if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
  set -- btc_oneshot "$@"
fi

if [ "$1" = 'btc_oneshot' -a "$(id -u)" = '0' ]; then
  chown -R bitcoin .
  exec gosu bitcoin "$0" "$@"
fi

exec "$@"