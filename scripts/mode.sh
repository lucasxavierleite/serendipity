#!/usr/bin/env sh

mode=`swaymsg -t get_bar_config $1 | jq -r '.mode'`

case $mode in
    'hide')
        text=''
        tooltip='Lock'
        ;;
    'dock')
        text=''
        tooltip='Unlock'
        ;;
    *)
        printf 'Not implemented'
        exit
        ;;
esac

#printf '%s\n%s\n%s\n' $text $tooltip $mode
printf '{ "text": "%s", "tooltip": "%s", "class": "%s" }\n' $text $tooltip $mode
