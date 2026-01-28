#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT1/capacity)

RED="#FF0000"
YELLOW="#FFFF00"
ORANGE="#FFCC00"
LIME="#00FF00"

if [ $capacity -eq 100 ]; then
        echo -e "%{F$LIME}$capacity%{F-}"
elif [ $capacity -ge 75 ]; then
        echo -e "%{F$YELLOW}$capacity%{F-}"
elif [ $capacity -ge 50 ]; then
        echo -e "%{F$ORANGE}$capacity%{F-}"
elif [ $capacity -gt 25 ]; then
        echo -e "%{F$RED}$capacity%{F-}"
else
        echo ""
fi
