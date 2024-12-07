#!/bin/bash

selected_file=$(find ~/Documents ~/Downloads ~/Videos -mindepth 1 -maxdepth 4 | grep -vE "\.git|\.md|\.txt" | wofi -i --matching=fuzzy --show dmenu -p "Select file to open")

if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
