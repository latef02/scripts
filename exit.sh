#!/bin/sh

choice=$(echo -e "Shutdown\nReboot\nSuspend\nHibernate\nExit"| dmenu -i -p "Choose Action: ")
[ $choice = "Shutdown" ] && sudo poweroff;
[ $choice = "Reboot" ] && sudo reboot;
[ $choice = "Suspend" ] && sudo systemctl suspend;
[ $choice = "Hibernate" ] && sudo systemctl hibernate;
[ $choice = "Exit" ] && killall dwm;
