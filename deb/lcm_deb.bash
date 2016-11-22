#!/bin/bash

VERSION=1.3.1
#wget --tries=10 https://github.com/lcm-proj/lcm/archive/v${VERSION}.tar.gz
tar xzf v${VERSION}.tar.gz
cd lcm-${VERSION}
SOURCE_DIR=`pwd`
INSTALL_PREFIX=/usr/local
echo $PYTHONPATH

sudo apt-get install build-essentials autoconf openjdk-7-jdk libglib2.0-dev
./bootstrap.sh
./configure
make
export DESTDIR=${SOURCE_DIR}/create_deb && make install
mv ${SOURCE_DIR}/create_deb/${INSTALL_PREFIX}/lib/python2.7/site-packages ${SOURCE_DIR}/create_deb/${INSTALL_PREFIX}/lib/python2.7/dist-packages
#find ${SOURCE_DIR}/create_deb -type f -print0 | xargs -0 sed -i 's:'${SOURCE_DIR}'/create_deb/:/:g'
mkdir -p create_deb/DEBIAN
SIZE=`du ${SOURCE_DIR}/create_deb/${INSTALL_PREFIX} -s | awk '{print $1;}'`
echo '
Package: liblcm
Version: '"$VERSION"'
Maintainer: Vladimir Ivan <v.ivan@ed.ac.uk>
Section: All
Priority: optional
Architecture: amd64
Installed-Size: '$SIZE'
Depends: openjdk-7-jdk, libglib2.0-dev, python2.7-dev
Homepage: https://lcm-proj.github.io/
Description: Lightweight Communications and Marshalling (LCM)
 LCM is a set of libraries and tools for message passing and data marshalling, targeted at real-time systems where high-bandwidth and low latency are critical. It provides a publish/subscribe message passing model and automatic marshalling/unmarshalling code generation with bindings for applications in a variety of programming languages.
' > ${SOURCE_DIR}/create_deb/DEBIAN/control

fakeroot dpkg-deb --build ${SOURCE_DIR}/create_deb ../liblcm.deb
