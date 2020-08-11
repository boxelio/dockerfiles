TEMPLATE = app
CONFIG += console
CONFIG -= qt
CONFIG -= app_bundle
DEFINES += MAX_VERBOSE_LEVEL=3
QMAKE_CFLAGS += -std=gnu99
QMAKE_CFLAGS += -g # For profiling

isEmpty(PREFIX) {
 PREFIX = /usr/local/
}
TARGET = multimon-ng
target.path = $$PREFIX/bin
INSTALLS += target

HEADERS += \
    multimon.h \
    gen.h \
    filter.h \
    filter-i386.h

SOURCES += \
    unixinput.c \
    uart.c \
    pocsag.c \
    selcall.c \
    hdlc.c \
    demod_zvei1.c \
    demod_zvei2.c \
    demod_zvei3.c \
    demod_pzvei.c \
    demod_dzvei.c \
    demod_ccir.c \
    demod_eia.c \
    demod_eea.c \
    demod_ufsk12.c \
    demod_poc24.c \
    demod_poc12.c \
    demod_poc5.c \
    demod_hapn48.c \
    demod_fsk96.c \
    demod_dtmf.c \
    demod_clipfsk.c \
    demod_fmsfsk.c \
    demod_afsk24.c \
    demod_afsk24_3.c \
    demod_afsk24_2.c \
    demod_afsk12.c \
    demod_flex.c \
    BCHCode.c \
    costabi.c \
    costabf.c \
    clip.c \
    fms.c \
    demod_eas.c \
    demod_morse.c \
    demod_dumpcsv.c \
    demod_x10.c


DEFINES += DUMMY_AUDIO
DEFINES += NO_X11
DEFINES += CHARSET_UTF8
