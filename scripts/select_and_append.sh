#!/bin/bash

input_file="exercises.txt"
output_file="new_routine.txt"

input_path="$HOME/dotfiles/scripts/$input_file"
output_path="$HOME/dotfiles/scripts/$output_file"

rm "$output_path"
touch "$output_path"

while true; do
	# Use fzf to select an option from the input file
	selected_option=$(cat "$input_path" | fzf --prompt="Select an option: " --height=40% --border --exit-0)

	# Capture the exit status of fzf
	fzf_exit_status=$?

	# If the user pressed Esc or Ctrl-C, exit the loop
	if [[ $fzf_exit_status -ne 0 ]]; then
		echo "Ending selection."
		break
	fi

	# Check if the selection is empty
	if [[ -z "$selected_option" ]]; then
		echo "No option selected. Exiting."
		break
	fi

	# Add the selected option to the end of the output file without extra spaces
	echo -ne "$selected_option\n" >>"$output_path"
	echo "Added '$selected_option' to $output_file"
done

echo "Completed $output_path"
