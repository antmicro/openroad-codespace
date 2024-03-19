#!/bin/bash

source ./env.sh
yosys -help
openroad -help
cd flow
make

# make gui_final
