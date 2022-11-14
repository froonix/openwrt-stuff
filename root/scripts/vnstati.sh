#!/bin/sh

case $1 in
-5)  arg="--fiveminutes" ;;
-5g) arg="--fivegraph"   ;;
-h)  arg="--hours"       ;;
-hg) arg="--hoursgraph"  ;;
-d)  arg="--days"        ;;
-m)  arg="--months"      ;;
-y)  arg="--years"       ;;
-t)  arg="--top"         ;;
-s)  arg="--summary"     ;;
-hs) arg="--hsummary"    ;;
-vs) arg="--vsummary"    ;;
*)   exit 1              ;;
esac

if [ "$2" = "" ]; then exit 2; fi
file=$(mktemp); if [ "$file" = "" ]; then exit 3; fi
mv -n "$file" "$file.png" && vnstati "$arg" --iface "$2" --output "$file.png" && cat "$file.png"
c=$?; rm -f "$file" "$file.png" && exit "$c"; exit 5
