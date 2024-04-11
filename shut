#!/bin/bash

# Display a rofi prompt to get the shutdown time
shutdown_time=$(rofi -dmenu -p "Shutdown in (minutes):" -lines 1 -font "hack 20" <<< "" | awk '{print $1}')

# Check if the shutdown time is valid
if ! [[ "$shutdown_time" =~ ^[0-9]+$ ]]; then
    echo "Invalid input"
    exit 1
fi

# Wait for the specified amount of time and then shut down the computer
sleep "$shutdown_time"m && poweroff

