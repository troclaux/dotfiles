-- SET

vim.g.mapleader = " "

vim.opt.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.scrolloff = 8


-- REMAP

-- Map jk and kj to go to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Map <leader>w to save the current file.
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })

-- Map <leader>q to close the current buffer.
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', { noremap = true })

-- Map <leader>x to change word and go to next instance
vim.api.nvim_set_keymap('n', '<Leader>r', '*``cgn', {noremap = true})

-- Map J and K to reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- control+d and control+u will keep viewport centralized
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

