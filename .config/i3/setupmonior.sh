#!/bin/bash
#SECONDARY="DP-3"
LAPTOP="eDP-1"
PRIMARY="DP-1-2"
SECONDARY="DP-1-1"

CONNECTED=$(xrandr | grep " connected " | awk '{ print$1 }')

if [[ $CONNECTED == *"DP-3"* ]]; then
    xrandr --output DP-3 --mode 1920x1080 --scale 2x2 --pos 0x120 --output eDP-1 --primary --rate 60.00 --pos 3840x0
    xinput map-to-output 11 eDP-1
    exit 0

elif [[ $CONNECTED == *"$PRIMARY"* ]] && [[ $CONNECTED == *"$SECONDARY"* ]]; then
    xrandr --output $LAPTOP --off --output $PRIMARY --primary --mode 1920x1080 --scale 2x2 --pos 3840x0 --output $SECONDARY --pos 0x0 --scale 2x2 --mode 1920x1080
    exit 0

fi

xrandr --output eDP-1 --rate 60.00 --primary --pos 0x0 --output DP-3 --off --output $PRIMARY --off --output $SECONDARY --off
exit 0
