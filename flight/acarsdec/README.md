# acarsdec

Decode ACARS using an RTL-SDR and send it to a collection server (like airframes.io).

## Usage

| Variable | Default | Description |
| -------- | ------- | ----------- |
| DESTINATION_HOST | 0.0.0.0 | Destination for JSON output, default is to samplicator docker image. Replace with remote hostname/address if not using samplicator. |
| DESTINATION_PORT | 5555 | Port to send the UDP JSON output to. |
| FREQUENCIES | 131.550 131.525 131.725 131.825 130.025 130.425 130.450 131.125 | Frequencies to decode packets on, up to 8 channels. More channels uses more CPU. |
| RTL_DEVICE | 0 | Receiver to use, is usually 0. |
| RTL_GAIN | 0 | Actual gain times 10, thus a +40 gain is actually 400 |
| STATION_IDENT | XX-YYYY-ACARSDEC | Identication for the station. If using airframes.io as a destination then you can send either an ident or UUID for the existing station. |
| ACARSDEC_OPTIONS | -v -o 4 | Override the dynamically created options parameters for acarsdec. Be careful here! |

## Upstream Source

[https://github.com/TLeconte/acarsdec](https://github.com/TLeconte/acarsdec)

## Upstream Description

Acarsdec is a multi-channels acars decoder with built-in rtl_sdr, airspy front end or sdrplay device. Since 3.0, It comes with a database backend : acarsserv to store received acars messages. (See acarsserv chapter below).

Features:

* up to 8 channels decoded simultaneously
* error detection AND correction
* input via rtl_sdr, or airspy or sdrplay software defined radios (SDR)
* logging data over UDP in planeplotter or acarsserv formats to store in an sqlite database, or JSON for custom processing.
* decoding of ARINC-622 ATS applications (ADS-C, CPDLC) via libacars library

Multi-channel decoding is particularly useful with broadband devices such as the RTLSDR dongle, the AIRspy and the SDRplay device. It allows the user to directly monitor to up to 8 different frequencies simultaneously with very low cost hardware.

## Platforms

armv6, armv7, arm64, amd64
