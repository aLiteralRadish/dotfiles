#!/bin/bash

maim | xclip -selection clipboard -t image/png -i && notify-send "Copied to clipboard!"
