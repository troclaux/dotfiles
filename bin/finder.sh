#!/bin/bash

selected_file=$(find ~/Documents ~/Downloads ~/learning -mindepth 1 -maxdepth 4 | grep -vi ".git" | wofi --matching=fuzzy --show dmenu)
if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
