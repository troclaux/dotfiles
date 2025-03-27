#!/bin/bash

file="$HOME/dotfiles/scripts/buffer.txt"

if [ ! -f "$file" ]; then
	nvim "$file"
fi

selected_line=$(cat "$file" | wofi -i --matching=fuzzy --show dmenu -p "Select text to copy")

if [ -n "$selected_line" ]; then
	echo -n "$selected_line" | wl-copy
fi
