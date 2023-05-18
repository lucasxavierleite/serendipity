#!/usr/bin/env sh

state=`swaymsg -t get_bar_config $1 | jq -r '.hidden_state'`

case $state in
    'hide')
        text=''
        tooltip='Lock'
        ;;
    'show')
        text=''
        tooltip='Unlock'
        ;;
    *)
        printf 'Not implemented'
        exit
        ;;
esac

#printf '%s\n%s\n%s\n' $text $tooltip $state
printf '{ "text": "%s", "tooltip": "%s", "class": "%s" }\n' $text $tooltip $state
