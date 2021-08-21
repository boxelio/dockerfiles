FROM ubuntu:20.04

ARG SOURCE_DIR=~/source

RUN apt update && apt -y upgrade
RUN DEBIAN_FRONTEND=noninteractive \
    apt install -y gnuradio gnuradio-dev gr-osmosdr libhackrf-dev libuhd-dev git cmake build-essential \
                   libboost-all-dev libusb-1.0-0-dev libcppunit-dev liblog4cpp5-dev libssl-dev autoconf \
                   automake libass-dev libfreetype6-dev libsdl2-dev libtheora-dev libtool libva-dev libvdpau-dev \
                   libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev \
                   libcurl4-openssl-dev sox

RUN mkdir -p ${SOURCE_DIR}
RUN git clone --depth 1 https://github.com/mstorsjo/fdk-aac ${SOURCE_DIR}/fdk-aac
RUN git clone https://github.com/nu774/fdkaac ${SOURCE_DIR}/fdk-aac-cli-enc
RUN git clone https://github.com/robotastic/trunk-recorder.git ${SOURCE_DIR}/trunk-recorder

RUN cd ${SOURCE_DIR}}/fdk-aac && autoreconf -fiv && ./configure && make -j2 && make install
RUN cd ${SOURCE_DIR}/fdk-aac-cli-env && autoreconf -i && ./configure && make && make install
RUN ldconfig
RUN mkdir ${SOURCE_DIR}/trunk-recorder/build && cd ${SOURCE_DIR}/trunk-recorder/build && cmake .. && make
