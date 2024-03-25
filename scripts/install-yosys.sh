#!/bin/bash
# Copyright (c) 2024 Antmicro <www.antmicro.com>
# SPDX-License-Identifier: Apache-2.0

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends ca-certificates gperf build-essential bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python2 python3 python-is-python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev
update-ca-certificates

git clone https://github.com/YosysHQ/yosys.git
cd yosys
mkdir build
cd build
make -f ../Makefile config-$CC
make -f ../Makefile -j$procs
make install
