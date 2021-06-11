#!/usr/bin/env bash

host=x86_64-apple-darwin11
build_dir=$3
repo=$2
version=$1

rm -rf $build_dir
git clone $repo -b $version
cd $build_dir


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
