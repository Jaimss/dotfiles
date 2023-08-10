#!/bin/bash
LAPTOP="eDP-1"
ALL_MONITORS=$(xrandr | grep connected | awk '{ print$1 }')

source $HOME/.config/scripts/monitor_env_vars.sh

# stop all monitors
OUTPUTS=""
for monitor in $ALL_MONITORS; do
    echo $monitor
    OUTPUTS="$OUTPUTS --output $monitor --off"
done
xrandr $OUTPUTS


if [[ -v DUAL_MONITOR_SECONDARY ]]; then

    # if a dual monitor exists, use it
    xrandr \
        --output $DUAL_MONITOR_PRIMARY \
        --primary \
        --pos 3840x0 --scale 2x2 --mode 1920x1080 \
        --output $DUAL_MONITOR_SECONDARY \
        --pos 0x0 --scale 2x2 --mode 1920x1080

else

    # otherwise use the main
    xrandr \
        --output ${DUAL_MONITOR_PRIMARY:-$LAPTOP} \
        --primary \
        --mode 3840x2400 --rate 60.00

    xinput map-to-output 11 ${DUAL_MONITOR_PRIMARY:-$LAPTOP}

fi
