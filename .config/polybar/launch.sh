#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

source $HOME/.config/scripts/monitor_env_vars.sh

polybar main >>/tmp/polybar1.log 2>&1 & disown
polybar secondary >>/tmp/polybar1.log 2>&1 & disown
#polybar laptop >>/tmp/polybar1.log 2>&1 & disown

# if type "xrandr"; then
    # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        # MONITOR=$m polybar i3 &
    # done
# else
    # polybar i3 &
# fi

echo "Bars launched..."
