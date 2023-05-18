#!/usr/bin/env sh

#declare -a options=('Shutdown', 'Reboot', 'Suspend', 'Hibernate' 'Cancel')
#action=`printf '%s\n' "${options[@]%,}" | wofi --show dmenu -W 300 -H 300`

options="Shutdown Reboot Suspend Hibernate Cancel"
action=`printf '%s\n' $options | wofi --show dmenu -W 300 -H 300`

case $action in
    'Shutdown')
        error=$(systemctl poweroff 2>&1 > /dev/null)
        notify-send "$error"
        ;;
    'Reboot')
        error=`systemctl reboot 2>&1 > /dev/null`
        notify-send $error
        ;;
    'Suspend')
        error=`systemctl suspend 2>&1 > /dev/null`
        notify-send $error
        ;;
    'Hibernate')
        error=`systemctl hibernate 2>&1 > /dev/null`
        notify-send $error
        ;;
    'Cancel' | '')
        notify-send 'Cancel'
        ;;
    *)
        notify-send 'Invalid option'
        ;;
esac
