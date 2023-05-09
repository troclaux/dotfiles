-- SET

vim.g.mapleader = " "

vim.opt.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.scrolloff = 8

vim.opt.hlsearch = true
vim.opt.incsearch = true


-- REMAP

-- Map jk and kj to go to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Map control+delete to delete whole word in insert mode
vim.api.nvim_set_keymap('i', '<C-Delete>', '<Esc>ldwi', { noremap = true })

-- Go to end of line and delete until end of line
vim.api.nvim_set_keymap('n', 'ç', '$', { noremap = true })
vim.api.nvim_set_keymap('n', 'dç', 'd$', { noremap = true })
vim.api.nvim_set_keymap('n', 'yç', 'y$', { noremap = true })

-- Join current line with line below and keep cursor on same position
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Map <leader>x to make a script executable
vim.api.nvim_set_keymap('n', '<leader>x', ':w<bar>!chmod +x %<cr>', { noremap = true, silent = true })

-- Map <leader>p to vim file explorer
vim.api.nvim_set_keymap('n', '<leader>p', ':Ex<CR>', { noremap = true })

-- Map <leader>enter to open shell to insert command
vim.api.nvim_set_keymap('n', '<leader><CR>', ':!', { noremap = true })

-- Map <leader>enter to open shell to insert command
vim.api.nvim_set_keymap('n', '<leader>b', ':b#<CR>', { noremap = true })

-- Map <leader>so to source current file
vim.api.nvim_set_keymap('n', '<leader>so', ':source<CR>', { noremap = true })

-- Map Control+f to tmux-sessionizer
vim.api.nvim_set_keymap('n', '<C-f>', ':!tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })

-- Map <leader>i to remove all extra split screens and focus on the one with the cursor
vim.api.nvim_set_keymap('n', '<leader>i', ':only<CR>', { noremap = true })

-- Git push
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true })

-- Git pull
vim.api.nvim_set_keymap('n', '<leader>gu', ':Git pull<CR>', { noremap = true })

-- Search commit messages ( git -log -S <pattern> )
vim.api.nvim_set_keymap('n', '<leader>gl', ':GcLog -S ', { noremap = true })

-- Map <leader>o to quit vim
vim.api.nvim_set_keymap('n', '<leader>o', ':q<CR>', { noremap = true })

-- Map <leader>w to save the current file
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })

-- Change word and go to next instance
vim.api.nvim_set_keymap('n', '<Leader>r', '*``cgn', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>R', '*``cgN', {noremap = true})

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- control+d and control+u will keep viewport centralized
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Map yp to yank a paragraph
vim.api.nvim_set_keymap('n', 'yp', 'yap:execute >normal! j/^$`<cr>P"<cr>', { noremap = true })

-- Replace line with yanked line
vim.api.nvim_set_keymap('n', 'dp', 'pkddyy', { noremap = true })

-- Map J and K to reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Select until end of line in visual mode 
vim.api.nvim_set_keymap('v', 'ç', '$', { noremap = true })

-- Copy into system clipboard
vim.keymap.set('n', '<Leader>y', '\"+yy')
vim.keymap.set('v', '<Leader>y', '\"+y')
vim.keymap.set('n', '<Leader>Y', '\"+Y')
