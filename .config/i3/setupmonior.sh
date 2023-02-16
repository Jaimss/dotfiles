#!/bin/bash
SECONDARY="DP-3"

CONNECTED=$(xrandr | grep " connected " | awk '{ print$1 }')

if [[ $CONNECTED == *"DP-3"* ]]; then
    xrandr --output DP-3 --mode 1920x1080 --scale 2x2 --pos 0x120 --output eDP-1 --primary --pos 3840x0
    xinput map-to-output 11 eDP-1
    exit 0
fi

xrandr --output eDP-1 --primary --pos 0x0 --output DP-3 --off
exit 0
