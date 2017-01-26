#!/bin/sh
PIDFILE="/var/run/apcupsd-ups-ups.pid"
PARENTPIDFILE="/var/run/upsd.pid"

if [ -f "$PIDFILE" ]
then
	kill -0 "$(cat "$PIDFILE")" 2>/dev/null
	if [ "$?" -eq "0" ]; then exit 0; fi
fi

if [ ! -f "$PARENTPIDFILE" ]; then exit 2; fi
kill -0 "$(cat "$PARENTPIDFILE")" 2>/dev/null
if [ ! "$?" -eq "0" ]; then exit 2; fi

logger -s "Restarting NUT server..."
/etc/init.d/nut-server.init restart
exit 1
