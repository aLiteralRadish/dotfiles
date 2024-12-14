#!/bin/bash

DEPTH=5
for ((i=1;i<=$DEPTH;i++))
do
	FILES+=$(find ~/Media/ -mindepth $i -maxdepth $i | sort)
	FILES+=$'\n'
done

FILES=$(echo "$FILES" | dmenu -nb $1 -nf $2 -sb $3 -sf $4 -p mpv -i -l 15)
mpv "$FILES"
