#!/bin/bash

#CURR=$(acpi -b | awk '{print $4}' | cut -c -2)
CURR=$(acpi -b | awk '{print $4}' | sed -e 's/[^0-9]/ /g')
#echo $CURR
if [ $CURR -lt 20 ]; then
    /usr/bin/notify-send -u critical "Low Battery" "Current: ${CURR}%\nFind a charger."
#elif [ $CURR -lt 10 ]; then
    #/usr/bin/notify-send -u critical "Low Battery" "Current: ${CURR}%\nFind a charger."
fi
