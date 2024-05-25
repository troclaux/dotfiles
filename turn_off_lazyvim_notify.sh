#!/bin/bash

if grep -q 'checker = { enabled = true' ~/.config/nvim/lua/config/lazy.lua; then
	sed -i 's/checker = { enabled = true/checker = { enabled = false/' ~/.config/nvim/lua/config/lazy.lua
	echo "Successfully updated checker setting in lazy.lua"
else
	echo "Failed to replace text in lazy.lua because the target string was not found"
fi
