#!/bin/bash
for DIR in $(ls /sys/class/net); do
    echo $DIR
    grep -s "" /sys/class/net/$DIR/* | grep -E "(carrier:|operstate)"
    echo
done
