#!/bin/bash

pdf_files=$(find ~/Documents/*/pdfs -maxdepth 1 -type f -name "*.pdf" 2>/dev/null)

find_files=$(find -L ~/Videos ~/Downloads ~/books ~/Documents -mindepth 1 -maxdepth 3 -type f 2>/dev/null)

combined_output=$(printf "%s\n%s" "$pdf_files" "$find_files")

selected_file=$(echo "$combined_output" | grep -vE "\.git|\.md|\.txt" | wofi -i --matching=fuzzy --show dmenu -p "Select file to open")

if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
