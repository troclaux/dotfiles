#!/bin/bash

selected_window=$(swaymsg -t get_tree | grep -E '"app_id":|"class":' | grep -v 'null' | awk -F': ' '{print $2}' | tr -d '", ' | sort -u | wofi -i --matching=fuzzy --show dmenu)

if [ -n "$selected_window" ]; then
  swaymsg [app_id="$selected_window"] focus
  swaymsg [class="$selected_window"] focus
fi

swaymsg [class="Brave-browser"] focus
# swaymsg [pid="72640"] focus
