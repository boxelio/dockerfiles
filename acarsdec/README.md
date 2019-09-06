# acarsdec

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

armv7, arm64, amd64
