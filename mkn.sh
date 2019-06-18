#!/usr/bin/env bash

# set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="gsl"
VERSION="master"
GIT_URL="https://github.com/dekken/gsl"

mkdir -p $CWD/inc $CWD/lib && rm -rf $CWD/inc/* $CWD/lib/*
[ ! -d "$CWD/$DIR" ] && git clone --depth 1 $GIT_URL -b $VERSION $DIR --recursive
rm -rf $CWD/$DIR/build && mkdir -p $CWD/$DIR/build && cd $CWD/$DIR/build
cmake -DCMAKE_INSTALL_PREFIX=$PWD -DBUILD_SHARED_LIBS=ON ..
make install -j2
mv gsl $CWD/inc
cp lib/lib* $CWD/lib
cp config.h $CWD/inc
rm -rf $CWD/$DIR/build
cd $CWD
