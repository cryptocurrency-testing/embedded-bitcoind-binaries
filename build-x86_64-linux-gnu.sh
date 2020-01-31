#!/usr/bin/env bash

host=x86_64-linux-gnu
git clone https://github.com/cryptocurrency-testing/bitcoin -b $1
cd bitcoin
./autogen.sh
make -j2 -C depends HOST=$host
./configure --with-incompatible-bdb --with-zmq --host=$host --prefix=$PWD/depends/$host
make -j2 HOST=$host
