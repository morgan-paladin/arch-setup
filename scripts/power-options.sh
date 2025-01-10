#!/bin/bash

# Define the shutdown options

options="󰐥  Shutdown\n  Reboot\n󰗽  Logout\n  Hibernate"

# Use rofi to display the options and capture the selected option
choice=$(echo -e "$options" | rofi -dmenu -p " " -theme "/usr/share/rofi/themes/rounded-orange-dark.rasi" )

# Execute the selected option
case $choice in
  "󰐥  Shutdown")
    systemctl poweroff
    ;;
  "  Reboot")
    reboot
    ;;
  "󰗽  Logout")
    pkill -KILL -u $USER
    ;;
  "  Hibernate")
    systemctl hibernate
    ;;
  *)
    exit 1
    ;;
esac

