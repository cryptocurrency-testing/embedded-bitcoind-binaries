#!/usr/bin/env bash

git clone https://github.com/cryptocurrency-testing/bitcoin -b $1
cd bitcoin
./autogen.sh
./configure --with-incompatible-bdb --with-zmq
make
