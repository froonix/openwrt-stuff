#!/bin/sh
logread | tail -n 50 && logread -f
