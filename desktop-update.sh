#!/bin/bash

. ./common.sh

log "** SCRIPT START **"

# Start dbus.
log 'Running "/etc/init.d/dbus start".'
if [ -f "/var/run/dbus/pid" ] && ! pgrep -x dbus-daemon  > /dev/null; then
    sudoIf rm -f /var/run/dbus/pid
fi
sudoIf /etc/init.d/dbus start 2>&1 | sudoIf tee -a /tmp/dbus-daemon-system.log > /dev/null
while ! pgrep -x dbus-daemon > /dev/null; do
    sleep 1
done

# Startup tigervnc server and fluxbox
sudoIf rm -rf /tmp/.X11-unix /tmp/.X*-lock
mkdir -p /tmp/.X11-unix
sudoIf chmod 1777 /tmp/.X11-unix
sudoIf chown root:${group_name} /tmp/.X11-unix
if [ "$(echo "${VNC_RESOLUTION}" | tr -cd 'x' | wc -c)" = "1" ]; then VNC_RESOLUTION=${VNC_RESOLUTION}x16; fi
screen_geometry="${VNC_RESOLUTION%*x*}"
screen_depth="${VNC_RESOLUTION##*x}"
startInBackgroundIfNotRunning "Xtigervnc" sudoUserIf "tigervncserver ${DISPLAY} -geometry ${screen_geometry} -depth ${screen_depth} -rfbport 5901 -dpi ${VNC_DPI:-96} -localhost -desktop fluxbox -fg" -passwd /usr/local/etc/vscode-dev-containers/vnc-passwd

# Spin up noVNC if installed and not running.
if [ -d "/usr/local/novnc" ] && [ "$(ps -ef | grep /usr/local/novnc/noVNC*/utils/launch.sh | grep -v grep)" = "" ]; then
    keepRunningInBackground "noVNC" sudoIf "/usr/local/novnc/noVNC*/utils/launch.sh --listen 6080 --vnc localhost:5901"
    log "noVNC started."
else
    log "noVNC is already running or not installed."
fi

# Run whatever was passed in
log "Executing \"$@\"."
exec "$@"
log "** SCRIPT EXIT **"
