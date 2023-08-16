#!/bin/sh
arg=$1
[ $arg = "Up"   ] && pactl set-sink-volume 0 +10%
[ $arg = "Down" ] && pactl set-sink-volume 0 -10%
pkill -RTMIN+30 dwmblocks

