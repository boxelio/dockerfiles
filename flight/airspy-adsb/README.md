# airspy-adsb

Multi-arch docker image of airspy_adsb, an ADS-B decoder written and optimized for the Airspy line of SDRs.

## Usage

| Variable | Default | Description |
| -------- | ------- | ----------- |
| AIRSPY_ADSB_PORT | 33333 | Port to expose that will be listened on in AIRSPY_NET |
| AIRSPY_BIAS | -b | Enable Bias-T if defined |
| AIRSPY_GAIN | 15 | Gain (from 1 to 21) |
| AIRSPY_PREAMBLE | 9.87 | |
| AIRSPY_OPTIONS | -v -f 2 -t 300 | Main set of options to pass in |
| AIRSPY_SAMPLE_RATE | 20 | Sample rate |
| AIRSPY_NET | -l 33333:beast | Listen for incoming connections |
| AIRSPY_G | -g | |
| AIRSPY_M | -m | |
| AIRSPY_P | -e | |

## Docker Image Source

[https://github.com/boxelio/dockerfiles/tree/master/flight/airspy-adsb](https://github.com/boxelio/dockerfiles/tree/master/flight/airspy-adsb)

## Upstream Source

[https://airspy.com/download/](https://airspy.com/download/)

## Upstream Description

Airspy R0, R2 and Mini can be used as a high performance ADSB receiver capable of 20MHz, low scatter MLAT. The performance is comparable to top end, way more expensive ADSB receivers. This executable turns your Airspy into an autonomous ADSB station with low power requirements.
This build can be used with Raspberry PI and Odroid boards.

## Platforms

armv6, armv7, arm64, amd64
