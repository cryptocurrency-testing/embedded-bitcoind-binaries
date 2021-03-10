#!/usr/bin/env bash

host=x86_64-apple-darwin11
rm -rf bitcoin
git clone https://github.com/cryptocurrency-testing/bitcoin -b $1
cd bitcoin
mkdir -p depends/SDKs/
cp -R ../../../MacOSX10.11.sdk depends/SDKs/
ls -lsaht depends/SDKs

make -C depends HOST=$host NO_UPNP=1 NO_QT=1
if [ $? != 0 ]; then
    echo "Error: make depends failed"
    exit 1;
fi

./autogen.sh
./configure --with-incompatible-bdb --with-gui=no --disable-bench --disable-tests --with-zmq --host=$host --prefix=$PWD/depends/$host
make HOST=$host
if [ $? != 0 ]; then
    echo "Error: make failed"
    exit 1;
fi
