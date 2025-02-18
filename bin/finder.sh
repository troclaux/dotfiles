#!/bin/bash

combined_output=$( (
	ls ~/Documents/*/pdfs/*.pdf
	find -L ~/books ~/Documents ~/Downloads ~/Videos -mindepth 1 -maxdepth 4
))

selected_file=$(echo "$combined_output" | grep -vE "\.git|\.md|\.txt" | wofi -i --matching=fuzzy --show dmenu -p "Select file to open")

if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
