#!/bin/bash

cliphist list | rofi -dmenu -p "Clipboard" -theme "/usr/share/rofi/themes/rounded-orange-dark.rasi" | cliphist decode | wl-copy   
