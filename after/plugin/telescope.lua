local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' } )
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find Grep' } )
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' } )
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' } )
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find Old Files' } )
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find Git Files' } )

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

