#!/bin/sh

case $1 in
-h) arg="--hours"     ;;
-d) arg="--days"      ;;
-m) arg="--months"    ;;
-t) arg="--top10"     ;;
-s) arg="--summary"   ;;
-hs) arg="--hsummary" ;;
-vs) arg="--vsummary" ;;
*) exit 1 ;;
esac

if [ "$2" = "" ]; then exit 2; fi
file=`mktemp`; if [ "$file" = "" ]; then exit 3; fi
vnstati "$arg" --iface "$2" --output "$file" && cat "$file"
c=$?; rm -f "$file" && exit "$c"; exit 5
