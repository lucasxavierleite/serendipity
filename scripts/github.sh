#!/usr/bin/env sh

token=`cat $HOME/.config/github/notifications.token`
count=`curl -u lucas:${token} https://api.github.com/notifications | jq '. | length'`
tooltip=$count

[[ $count -gt 0 ]] && printf '{ "text": "%s", "tooltip": "%s", "class": "%s" }\n' $count $tooltip $class
