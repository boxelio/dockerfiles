# mictronics-readsb-protobuf

Multi-arch docker image of readsb-protobuf, a fork by Mictronics of FlightAware's flavor of mutability's dump1090.
This particular version optimizes the feed between readsb and the browser using protobuf.

## Upstream Source

[https://github.com/Mictronics/readsb-protobuf](https://github.com/Mictronics/readsb-protobuf)

## Upstream Description

Readsb is a Mode-S/ADSB/TIS decoder for RTLSDR, BladeRF, Modes-Beast and GNS5894 devices. As a former fork of dump1090-fa it is using that code base but development will continue as a standalone project with new name. Readsb can co-exist on the same host system with dump1090-fa, it doesn't use or modify its resources. However both programs will not share a receiver device at the same time and in parallel.

This version uses Googles protocol buffer for data storage and exchange with web application. Saves up to 70% in storage space and bandwidth.

## Platforms

armv6, armv7, arm64, amd64
