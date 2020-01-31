#!/usr/bin/env bash

host=x86_64-apple-darwin11
rm -rf bitcoin
git clone https://github.com/cryptocurrency-testing/bitcoin -b $1
cd bitcoin
mkdir -p depends/SDKs/
cp -R ../../../MacOSX10.11.sdk depends/SDKs/
make -j2 -C depends HOST=$host
./autogen.sh
./configure --with-incompatible-bdb --with-zmq --host=$host --prefix=$PWD/depends/$host
make -j2 HOST=$host
make deploy
