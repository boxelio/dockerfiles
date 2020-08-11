# samplicator

Receive UDP packets on a given port and then send it out to external destinations.

# Usage

| Variable | Default | Description |
| -------- | ------- | ----------- |
| LISTEN_PORT | 5555 | Port to listen for incoming UDP packets |
| DESTINATIONS | feed.example1.org/5555 feed.example2.org/5555 | Where to send the UDP packets to after receiving them. Must be in the `host/port` format.
| DEBUG_LEVEL | 2 | Higher is more debug

## Upstream Source

[https://github.com/sleinen/samplicator](https://github.com/sleinen/samplicator)

## Upstream Description

This small program receives UDP datagrams on a given port, and resends those datagrams
to a specified set of receivers. In addition, a sampling divisor N may be specified
individually for each receiver, which will then only receive one in N of the received
packets.

## Platforms

armv6, armv7, arm64, amd64
