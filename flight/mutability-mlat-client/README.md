# mutability-mlat-client

mutability's mlat-client for multilateration of ADS-B Mode S messages to an mlat-server.

## Upstream Source

[https://github.com/mutability/mlat-client](https://github.com/mutability/mlat-client)

## Upstream Description

This is a client that selectively forwards Mode S messages to a server that resolves the transmitter position by multilateration of the same message received by multiple clients.

The corresponding server code is available at https://github.com/mutability/mlat-server.

There is also support for running in a mode used to feed multilateration information to FlightAware via piaware. In this mode, the client is started automatically by piaware.

## Platforms

armv7, arm64, amd64
