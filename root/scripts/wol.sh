#!/bin/sh
case "$1"
in
	example)
		dev=eth0.123
		mac=00:11:22:33:44:55
		;;

	*)
		echo "Usage: $(basename "$0") TARGET" >&2
		exit 1
		;;
esac

logger "WOL: $mac ($dev)"
etherwake -D -i "$dev" "$mac"
