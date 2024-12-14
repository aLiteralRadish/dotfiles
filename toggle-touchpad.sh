#!/bin/bash

NAME="SYNA8020:00 06CB:CE5C Touchpad"

STATE=$(xinput list-props "$NAME" | head -2 | tail -1 | cut -d':' -f 2 | xargs)

if [ $STATE -eq 0 ]
then
	xinput enable "$NAME" && notify-send -i ~/.scripts/touchpad.png "Touchpad enabled"
else
	xinput disable "$NAME" && notify-send -i ~/.scripts/touchpad.png "Touchpad disabled"
fi

