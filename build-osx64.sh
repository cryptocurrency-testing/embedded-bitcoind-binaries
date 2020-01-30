#!/usr/bin/env bash

git clone https://github.com/cryptocurrency-testing/bitcoin -b $1
cd bitcoin
./autogen.sh
./configure --with-incompatible-bdb --with-zmq --host=x86_64-apple-darwin11
make -C depends HOST=x86_64-apple-darwin11
make HOST=x86_64-apple-darwin11
