#!/usr/bin/env bash

host=x86_64-linux-gnu
rm -rf bitcoin
git clone https://github.com/cryptocurrency-testing/bitcoin -b $1
cd bitcoin
make -j2 -C depends HOST=$host NO_QT=1 NO_UPNP=1
if [ $? != 0 ]; then
    echo "Make depends - failed"
    exit 1;
fi
./autogen.sh
./configure --with-incompatible-bdb --with-gui=no --disable-bench --disable-tests --with-zmq --host=$host --prefix=$PWD/depends/$host
make -j2 HOST=$host
