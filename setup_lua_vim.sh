#!/bin/bash

# WARNING: THIS SCRIPT WILL DELETE ALL ~/.config/nvim CONTENTS

rm -rf ~/.config/nvim/* && \

mkdir -p ~/.config/nvim/lua && \

# add lua config files
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua && \
ln -s ~/dotfiles/troclaux ~/.config/nvim/lua/troclaux
