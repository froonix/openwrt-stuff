#!/bin/sh

# Output interface name of active (IPv4) default routing.
ip -4 -o route get "8.8.8.8" | sed -r 's/^.+ dev ([A-Z0-9.-]+) .+$/\1/i' | sed -r 's/^.+-//'
