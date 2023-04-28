vim.g.mapleader = " "

-- Map jk and kj to go to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Map <leader>w to save the current file.
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })

-- Map <leader>q to close the current buffer.
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })

-- Map <leader>e to open vim file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Map <leader>x to change word and go to next instance
vim.api.nvim_set_keymap('n', '<Leader>r', '*``cgn', {noremap = true})

-- Map <leader>h and <leader>l to go to start and end of line
vim.api.nvim_set_keymap('n', '<Leader>h', '_', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '$', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader><CR>', ':!', { noremap = true })

