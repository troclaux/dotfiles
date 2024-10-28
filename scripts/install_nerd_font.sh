#!/bin/bash

# if gnome terminal is not rendering the font correctly, try installing another font

latest_url=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -o 'https://.*JetBrainsMono.zip') &&
	curl -fLo ~/Downloads/JetBrainsMono.zip "$latest_url" &&
	unzip -o ~/Downloads/JetBrainsMono.zip -d ~/Downloads/JetBrainsMono &&
	sudo cp -r ~/Downloads/JetBrainsMono /usr/share/fonts &&
	fc-cache -f -v
