
# create symlinks for plugins, settings and remaps

rm -rdf ~/.config/nvim/lua/custom/plugins && \
ln -s ~/dotfiles/plugins ~/.config/nvim/lua/custom/plugins && \

rm -rdf ~/.config/nvim/after && \
ln -s ~/dotfiles/after ~/.config/nvim/after

# change init.lua so that lualine displays full file path
sed -i '/component_separators/s/\(\s*\)\(component_separators\s*=\s*[^,]*,\)/\1\2\n\1path = 2,/' ~/.config/nvim/init.lua
