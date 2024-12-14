#!/bin/bash

SINK_NAME=$(pactl get-default-sink)
SINK=$(pactl list | grep -B2 "$SINK_NAME" | grep "Sink #[0-9]\+" | cut -d"#" -f 2)

pactl set-sink-mute $SINK toggle
if [[ $(pamixer --get-mute) =~ "true" ]]
then
	echo $(pamixer --get-volume)! > /tmp/xobpipe
else
	pamixer --get-volume > /tmp/xobpipe
fi
