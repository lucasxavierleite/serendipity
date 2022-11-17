#!/usr/bin/env sh

wd=$(dirname -- "$0")
waybar -c $wd/top_bar.jsonc -s $wd/style.css
