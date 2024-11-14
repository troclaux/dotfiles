#!/bin/bash

selected_file=$(find ~/Documents ~/Downloads -mindepth 1 -maxdepth 4 | grep -vE "\.git|\.md|\.txt" | wofi -i --matching=fuzzy --show dmenu)

if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
