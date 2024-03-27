#!/bin/bash

. common.sh

package_list="
    tigervnc-standalone-server \
    tigervnc-common \
    dbus-x11 \
    x11-utils \
    x11-xserver-utils \
    xdg-utils \
    fbautostart \
    at-spi2-core \
    xterm \
    eterm \
    nautilus\
    mousepad \
    seahorse \
    gnome-icon-theme \
    gnome-keyring \
    libx11-dev \
    libxkbfile-dev \
    libsecret-1-dev \
    libgbm-dev \
    libnotify4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xfonts-base \
    xfonts-terminus \
    fonts-noto \
    fonts-wqy-microhei \
    fonts-droid-fallback \
    htop \
    ncdu \
    curl \
    ca-certificates\
    unzip \
    nano \
    locales \
    xfwm4 \
    lxqt \
    breeze-icon-theme \
    vim \
    "

# Packages to attempt to install if essential tools are missing (ie: vncpasswd).
# This is useful, at least, for Ubuntu 22.04 (jammy)
package_list_additional="
    tigervnc-tools"

set -e

# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

apt_get_update
check_packages ${package_list}

# On newer versions of Ubuntu (22.04),
# we need an additional package that isn't provided in earlier versions
if ! type vncpasswd > /dev/null 2>&1; then
    check_packages ${package_list_additional}
fi
