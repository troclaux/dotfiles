#!/bin/bash

# extract JetBrainsMono on Downloads directory
# if the JetBrainsMono nerd mono font is not rendering correctly, try installing another font
# it may fix the problem with JetBrainsMono

sudo cp -r ~/Downloads/JetBrainsMono /usr/share/fonts
fc-cache -f -v
