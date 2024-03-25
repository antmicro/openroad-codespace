#!/bin/bash

# Create session config file
apt-get update
apt-get -y --no-install-recommends install lxqt

mkdir -p ~/.config/lxqt/
touch ~/.config/lxqt/session.conf

cat << EOF > ~/.config/lxqt/session.conf
[General]
__userfile__=true
window_manager=xfwm4
EOF
