#!/bin/bash

ps -e | dmenu -c -fn "FiraCode Mono:antialias=true:autohint=true" -nb $1 -nf $2 -sb $3 -sf $4 -l 15 | xargs kill -9
