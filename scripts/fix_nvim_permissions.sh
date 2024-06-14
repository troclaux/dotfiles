#!/bin/bash

if [ -d "~/.config/nvim" ]; then
	sudo chown -R $USER ~/.config/nvim/
	echo "Successfully changed ownership of ~/.config/nvim/ directory"
else
	echo "Failed to change ownership of ~/.config/nvim. Directory does not exist"
fi
