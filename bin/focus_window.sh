#!/bin/bash

selected_window=$(swaymsg -t get_tree | grep -E '"app_id":|"class":' | grep -v 'null' | awk -F': ' '{print $2}' | tr -d '", ' | sort -u | wofi -i --matching=fuzzy --show dmenu -p "Select window to focus")

if [ -n "$selected_window" ]; then
  swaymsg [app_id="$selected_window"] focus
  swaymsg [class="$selected_window"] focus
fi
