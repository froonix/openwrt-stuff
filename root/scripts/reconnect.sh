#/bin/sh
. /lib/functions/network.sh
network_get_device DEV "$1"

if [ "$DEV" != "" ] && /sbin/ifconfig "$DEV" &>/dev/null
then /usr/bin/logger -p "info" -t "reconnect" "Interface $1 ($DEV) is active, reconnect forced!"; ifup "$1"
else /usr/bin/logger -p "info" -t "reconnect" "Interface $1 is inactive, no reconnect forced."
fi
