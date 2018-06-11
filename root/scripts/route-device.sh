#!/bin/sh
if [ "$1" = "" ]
then
	echo "Usage: $0 <DEVICE> [<TABLE> [<MAIN>]]" 1>&2
	echo "Route DEVICE (ip/subnet) via TABLE. Creates source routing rules." 1>&2
	exit 1
fi

ip -4 rule add from "$1" to 10.0.0.0/8     priority 20001 lookup "${3:-main}" && \
ip -4 rule add from "$1" to 172.16.0.0/12  priority 20001 lookup "${3:-main}" && \
ip -4 rule add from "$1" to 192.168.0.0/16 priority 20001 lookup "${3:-main}" && \
ip -4 rule add from "$1"                   priority 20002 lookup "${2:-wan}"  && \

ip -4 route flush cache
exit $?
