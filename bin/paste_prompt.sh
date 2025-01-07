#!/bin/bash

if [ -z "$DOTFILES" ]; then
	echo "DOTFILES is not set"
	DOTFILES="$HOME/dotfiles"
fi

PROMPTS_PATH="$DOTFILES/prompts"
selected_file=$(find "$PROMPTS_PATH" -type f | wofi -i --matching=fuzzy --show dmenu -p 'Select prompt to paste')
selected_prompt_content=$(cat "$selected_file")
wtype "$(echo -e "$selected_prompt_content\n\n")"
