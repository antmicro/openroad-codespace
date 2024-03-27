# Base file is from devcontainers/features/desktop-lite/install.sh
# Original file is licensed as MIT
# Applied modifications to the script 2024

user_name="root"
group_name="root"
LOG=/tmp/container-init.log

export DBUS_SESSION_BUS_ADDRESS="autolaunch:"
export DISPLAY=":1"
export VNC_RESOLUTION="1920x1080x32"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Try to kill pid based on name
kill_pid()
{
PIDS_TO_KILL=$(ps axjf | grep $1 | awk '{print $2}')
for PID in ${PIDS_TO_KILL[@]}; do
    echo "Attempting to kill $PID"
    kill -9 $PID
done
}

# Execute the command it not already running
startInBackgroundIfNotRunning()
{
    log "Starting $1."
    echo -e "\n** $(date) **" | sudoIf tee -a /tmp/$1.log > /dev/null
    if ! pgrep -x $1 > /dev/null; then
        keepRunningInBackground "$@"
        while ! pgrep -x $1 > /dev/null; do
            sleep 1
        done
        log "$1 started."
    else
        echo "$1 is already running." | sudoIf tee -a /tmp/$1.log > /dev/null
        log "$1 is already running."
    fi
}

# Keep command running in background
keepRunningInBackground()
{
    ($2 bash -c "while :; do echo [\$(date)] Process started.; $3; echo [\$(date)] Process exited!; sleep 5; done 2>&1" | sudoIf tee -a /tmp/$1.log > /dev/null & echo "$!" | sudoIf tee /tmp/$1.pid > /dev/null)
}

# Use sudo to run as root when required
sudoIf()
{
    if [ "$(id -u)" -ne 0 ]; then
        sudo "$@"
    else
        "$@"
    fi
}

# Use sudo to run as non-root user if not already running
sudoUserIf()
{
    if [ "$(id -u)" -eq 0 ] && [ "${user_name}" != "root" ]; then
        sudo -u ${user_name} "$@"
    else
        "$@"
    fi
}

# Log messages
log()
{
    echo -e "[$(date)] $@" | sudoIf tee -a $LOG > /dev/null
}
