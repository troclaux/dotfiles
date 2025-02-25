#!/bin/bash

pdf_files=$(ls ~/Documents/*/pdfs/*.pdf 2>/dev/null || echo "")

find_files=$(find -L ~/Videos ~/Downloads ~/books ~/Documents -mindepth 1 -maxdepth 4 -type f 2>/dev/null)

combined_output=$(printf "%s\n%s" "$pdf_files" "$find_files")

selected_file=$(echo "$combined_output" | grep -vE "\.git|\.md|\.txt" | wofi -i --matching=fuzzy --show dmenu -p "Select file to open")

if [ -n "$selected_file" ]; then
	xdg-open "$selected_file"
fi
