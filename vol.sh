#!/bin/bash

SINK_NAME=$(pactl get-default-sink)
SINK=$(pactl list | grep -B2 "$SINK_NAME" | grep "Sink #[0-9]\+" | cut -d"#" -f 2)

pactl set-sink-mute $SINK false
pactl set-sink-volume $SINK $1
pamixer --get-volume > /tmp/xobpipe
