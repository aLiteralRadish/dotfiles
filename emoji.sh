#!/bin/bash

cat ~/.scripts/emojis | dmenu -fn "FiraCode Mono:pixelsize=20pantialias=true:autohint=true" -nb $1 -nf $2 -sb $3 -sf $4 -g 8 -l 5 -c | grep -o "^." | xclip -r -selection clip
