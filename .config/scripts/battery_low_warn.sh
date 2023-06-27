CURR=$(acpi -b | awk '{print $4}' | cut -c -2)
echo $CURR
if [ $CURR -lt 20 ]; then
    notify-send -u critical "Low Battery" "Current: ${CURR}%\nFind a charger."
fi
if [ $CURR -lt 10 ]; then
    notify-send -u critical "Low Battery" "Current: ${CURR}%\nFind a charger."
fi
