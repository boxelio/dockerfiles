# vdlm2dec

Decode VDL (spiritual successor to ACARS) using an RTL-SDR and send it to a collection server (like airframes.io).

## Usage

| Variable | Default | Description |
| -------- | ------- | ----------- |
| DESTINATION_HOST | 0.0.0.0 | Destination for JSON output, default is to a samplicator docker image. Replace with remote hostname/address if not using samplicator. |
| DESTINATION_PORT | 5555 | Port to send the UDP JSON output to. |
| FREQUENCIES | 136.650 136.800 136.975 | Frequencies to decode packets on, up to 8 channels. More channels uses more CPU. |
| RTL_DEVICE | 0 | Receiver to use, is usually 0. |
| RTL_GAIN | 0 | Actual gain times 10, thus a +40 gain is actually 400 |
| STATION_IDENT | XX-YYYY-VDLM2DEC | Identication for the station. If using airframes.io as a destination then you can send either an ident or UUID for the existing station. |
| VDLM2DEC_OPTIONS | -v -J -G -E -U | Override the dynamically created options parameters for vdlm2dec. Be careful here! |

## Upstream Source

[https://github.com/TLeconte/vdlm2dec](https://github.com/TLeconte/vdlm2dec)

## Upstream Description

vdlm2dec is a vdl mode 2 decoder with built-in rtl_sdr or airspy front end.

It could decode up to 8 frequencies simultaneously (but in the same 2Mhz range).

It decodes ARINC-622 ATS applications (ADS-C, CPDLC) via libacars library.

## Platforms

armv6, armv7, arm64, amd64
