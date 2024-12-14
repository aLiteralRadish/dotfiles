#!/bin/bash

brightnessctl s $1
brightnessctl p | head -n 2 | tail -n 1 | sed -E 's/.*\(([0-9]+)%\)/\1/' > /tmp/xobpipe
