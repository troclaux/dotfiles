#!/bin/bash

file="$HOME/dotfiles/scripts/buffer.txt"

if [ ! -f "$file" ]; then
	echo "No file found in the current directory."
	exit 1
fi

selected_line=$(cat "$file" | wofi -i --matching=fuzzy --show dmenu -p "Select text to copy")

if [ -n "$selected_line" ]; then
	echo -n "$selected_line" | wl-copy
fi
