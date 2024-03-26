#!/bin/bash

# Create session config file
apt-get update
apt-get -y --no-install-recommends install lxqt
apt-get -y --no-install-recommends install xfwm4 breeze-icon-theme oxygen-icon-theme


# https://www.linuxfromscratch.org/blfs/view/svn/lxqt/post-install.html
# https://wiki.archlinux.org/title/LXQt

# cat << EOF > ~/.config/lxqt/session.conf
# [General]
# __userfile__=true
# window_manager=xfwm4
# EOF
