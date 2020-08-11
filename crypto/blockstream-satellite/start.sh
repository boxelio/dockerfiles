#!/bin/sh

bitcoind -fecreaddevice=/tmp/blocksat/bitcoinfibre &
blocksat-rx -f $FREQUENCY_IN_HZ
