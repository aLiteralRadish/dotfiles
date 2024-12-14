#!/bin/bash

maim -s | xclip -selection clipboard -t image/png -i && notify-send "Copied to clipboard!"
