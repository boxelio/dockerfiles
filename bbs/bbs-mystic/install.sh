#!/bin/sh

LINUX_ARM_URL="http://www.mysticbbs.com/downloads/mys112a43_pi.zip"
LINUX_ARM_FILE="mys112a43_pi.zip"
LINUX_X86_URL="http://www.mysticbbs.com/downloads/mys112a43_l32.rar"
LINUX_X86_FILE="mys112a43_l32.rar"
LINUX_X64_URL="http://www.mysticbbs.com/downloads/mys112a43_l64.rar"
LINUX_X64_FILE="mys112a43_l64.rar"

mkdir -p /tmp/mystic-install

if [ "$TARGETPLATFORM" == "linux/arm/v7" ]
then
  echo "Building for Linux (ARM v7)"
  curl -o /tmp/${LINUX_ARM_FILE} ${LINUX_ARM_URL}
  unzip /tmp/${LINUX_ARM_FILE} -d /tmp/mystic-install
elif [ "$TARGETPLATFORM" == "linux/arm64" ]
then
  echo "Building for Linux (ARM64)"
  curl -o /tmp/${LINUX_ARM_FILE} ${LINUX_ARM_URL}
  unzip /tmp/${LINUX_ARM_FILE} -d /tmp/mystic-install
elif [ "$TARGETPLATFORM" == "linux/amd64" ]
then
  echo "Building for Linux (AMD64)"
  curl -o /tmp/${LINUX_X64_FILE} ${LINUX_X64_URL}
  cd /tmp/mystic-install; unrar x /tmp/${LINUX_X64_FILE}
fi

ls -l /tmp/mystic-install

cd /tmp/mystic-install && ./install auto /mystic /mysticdata/ -o

echo "Mystic BBS is now installed!"