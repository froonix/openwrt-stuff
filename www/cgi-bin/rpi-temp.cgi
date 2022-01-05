#!/bin/sh
echo "Content-Type: text/plain"
echo
cat /sys/class/thermal/thermal_zone0/temp
