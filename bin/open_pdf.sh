#!/bin/bash

# --unrestricted: include hidden and gitignored files, like find did
find_files=$(fd --unrestricted --follow --type f --max-depth 3 --extension pdf \
	. ~/Videos ~/Downloads ~/books ~/Documents 2>/dev/null)

selected_file=$(echo "$find_files" | wofi -i --matching=fuzzy --show dmenu -p "Select file to open")

if [ -n "$selected_file" ]; then
	flatpak run org.kde.okular "$selected_file"
fi
