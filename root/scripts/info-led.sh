#!/bin/sh
while true
do
	if ping -c 1 -q device.example.net 1>/dev/null
	then trigger=default-on
	else trigger=none
	fi

	echo "$trigger" > "/sys/class/leds/amber:info/trigger"

	time=$(date +'%u%H') # S.M.A.R.T. Test at Monday
	[ "$trigger" = "default-on" ] && [ "$time" -ge 110 ] && [ "$time" -lt "122" ] && [ "$(date +%-d)" -le 28 ] \
	&& trigger=default-on || trigger=none

	echo "$trigger" > "/sys/class/leds/red:info/trigger"

	if [ -z "${1:-}" ]
	then
		exit
	fi

	sleep 10
done
