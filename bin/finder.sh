#!/bin/bash

find_files=$(find -L ~/Videos ~/Downloads ~/books ~/Documents -mindepth 1 -maxdepth 3 -type f 2>/dev/null)

selected_file=$(echo "$find_files" | grep -vE "\.git|\.md|\.txt" | wofi -i --matching=fuzzy --show dmenu -p "Select file to open")

if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
