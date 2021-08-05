#!/bin/sh
if [ -z "$1" ]
then
        echo "Usage: $0 <STANZA>" 1>&2
        exit 1
fi

fwknop -n "$1" -a "$(ip -4 -o route get 8.8.8.8 | egrep -o 'src [0-9.]+' | cut -d ' ' -f 2)"
exit $?
