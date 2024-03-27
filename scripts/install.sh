#!/bin/bash

export KLAYOUT_VER=${KLAYOUT_VER:-0.28.17-1}
export DEBIAN_FRONTEND=noninteractive

apt-get -qqy update
apt-get install -qqy --no-install-recommends git wget ca-certificates make

update-ca-certificates
wget https://www.klayout.org/downloads/Ubuntu-22/klayout_${KLAYOUT_VER}_amd64.deb
apt-get install -qqy --no-install-recommends ./klayout_${KLAYOUT_VER}_amd64.deb
rm -rf ./klayout_${KLAYOUT_VER}_amd64.deb

wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-03-26/oss-cad-suite-linux-x64-20240326.tgz
tar -xvf oss-cad-suite-linux-x64-20240326.tgz
rm -rf oss-cad-suite-linux-x64-20240326.tgz
mkdir -p /opt
mv oss-cad-suite /opt/oss-cad-suite

wget https://github.com/Precision-Innovations/OpenROAD/releases/download/2024-03-25/openroad_2.0_amd64-ubuntu22.04-2024-03-25.deb
apt-get install -qqy --no-install-recommends ./openroad_2.0_amd64-ubuntu22.04-2024-03-25.deb
rm -rf ./openroad_2.0_amd64-ubuntu22.04-2024-03-25.deb

cd ~
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git

apt-get clean
apt-get autoclean
