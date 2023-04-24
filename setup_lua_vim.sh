#!/bin/bash

# WARNING: REMOVE vim.init FILE BEFORE RUNNING THIS SCRIPT

mkdir -p ~/.config/nvim/lua && \
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua && \
ln -s ~/dotfiles/troclaux ~/.config/nvim/lua/troclaux
