#!/bin/bash

. ./common.sh

# Attempt to change default shell
chsh -s /bin/bash

# Install Konsole

# apt-get update
# sudoIf apt-get -y install gnome-terminal

# # Update fluxbox config

# fluxbox_apps="$(cat \
# << 'EOF'
#   [transient] (role=GtkFileChooserDialog)
#   [Dimensions]	{100% 100%}
#   [Position]	(CENTER)	{0 0}
# [end]
# EOF
# )"

# echo "${fluxbox_apps}" > ~/.fluxbox/apps

# fluxbox_menu="$(cat \
# << 'EOF'
# [begin] (  Application Menu  )
#     [exec] (File Manager) { nautilus ~ } <>
#     [exec] (Text Editor) { mousepad } <>
#     [exec] (Terminal) { gnome-terminal /bin/bash } <>
#     [exec] (Web Browser) { x-www-browser --disable-dev-shm-usage } <>
#     [submenu] (System) {}
#         [exec] (Set Resolution) { tilix -t "Set Resolution" -e bash /usr/local/bin/set-resolution } <>
#         [exec] (Edit Application Menu) { mousepad ~/.fluxbox/menu } <>
#         [exec] (Passwords and Keys) { seahorse } <>
#         [exec] (Top Processes) { tilix -t "Top" -e htop } <>
#         [exec] (Disk Utilization) { tilix -t "Disk Utilization" -e ncdu / } <>
#         [exec] (Editres) {editres} <>
#         [exec] (Xfontsel) {xfontsel} <>
#         [exec] (Xkill) {xkill} <>
#         [exec] (Xrefresh) {xrefresh} <>
#     [end]
#     [config] (Configuration)
#     [workspaces] (Workspaces)
# [end]
# EOF
# )"

# echo "${fluxbox_menu}" > ~/.fluxbox/menu

# kill_pid tigervncserver
# kill_pid novnc

# ps axjf | grep tigervncserver
# ps axjf | grep novnc

# bash desktop-update.sh

# Create session config file
sudoIf apt-get -y --no-install-recommends install lxqt

cat << EOF > ~/.config/lxqt/session.conf
[General]
__userfile__=true
window_manager=xfwm4
EOF
#

