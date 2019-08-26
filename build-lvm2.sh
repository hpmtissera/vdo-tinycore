#!/usr/bin/env bash

git clone https://sourceware.org/git/lvm2.git
cd lvm2

git checkout v2_02_170 -b v2_02_170

./configure --enable-cmdlib --enable-dmeventd
make install
cd daemons
make install
