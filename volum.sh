#!/bin/sh
arg=$1
[ $arg = "Up"   ] && pactl set-sink-volume 0 +10%
[ $arg = "Down" ] && pactl set-sink-volume 0 -10%

get_vol=$(vol); \
dunstify  "Volume: "$get_vol -t 1000 -r 1



#VOLUME_INFO=$(pactl get-sink-volume 0 | grep -Eo '[0-9]+%')
#if [[ $1 == "-inc" ]]; then
#  notify-send "Volume Up  ($VOLUME_INFO)"
#else
#  notify-send "Volume Down  ($VOLUME_INFO)"
#fi

pkill -RTMIN+30 dwmblocks





#{super + Up, super + Down}
#{pactl set-sink-volume 0 +10%,pactl set-so,c-volume 0 -10%}; \
#get_vol=$(vol -get | cut -f 1 -d '.'); \
#dunstify "  Volume: "$get_vol -t 1000 -r 1
#pkill -RTMIN+30 dwmblocks

