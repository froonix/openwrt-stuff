#!/bin/sh
result=""

if ping -w 30 -c 3 -n "8.8.8.8" &>/dev/null
then result="4${result}"; fi

if ping -w 30 -c 3 -n "2001:4860:4860::8888" &>/dev/null
then result="${result}6"; fi

if [ "$result" = "46" ];  then result="O" # ---
elif [ "$result" = "4" ]; then result="T" # -__
elif [ "$result" = "6" ]; then result="M" # --_
else                           result="HH"; fi

echo "morse" > /sys/class/leds/netgear\:green\:usb/trigger
echo " ${result} " > /sys/class/leds/netgear\:green\:usb/message
echo "Now morsing \"${result}\" via USB led..." 1>&2
