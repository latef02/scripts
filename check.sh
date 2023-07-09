#!/bin/bash

# Get a list of available USB devices
usb_devices=$(lsblk -nrdo NAME,LABEL | grep -i 'sdc' | awk '{print $1 " (" $2 ")"}')

# Prompt the user to select a USB device using dmenu
selected_device=$(echo "$usb_devices" | dmenu -i -p "Select a USB device to mount:" | awk '{print $1}')

# Check if the selected USB device is already mounted
if grep -qs "/media/$selected_device" /proc/mounts; then
    echo "USB device is already mounted."
else
    # If the USB device is not mounted, mount it
    sudo mount "/dev/$selected_device" "/media/$selected_device"
    echo "USB device mounted."
fi

# Open the mounted USB device with the default file manager
sudo thunar "/media/$selected_device"

