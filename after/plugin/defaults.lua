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
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })

-- Map control+delete to delete whole word in insert mode
vim.keymap.set('i', '<C-Delete>', '<Esc>ldwi', { noremap = true })

-- Go to end of line and delete until end of line
vim.keymap.set('n', 'ç', '$', { noremap = true })
vim.keymap.set('n', 'dç', 'd$', { noremap = true })
vim.keymap.set('n', 'yç', 'y$', { noremap = true })

-- Join current line with line below and keep cursor on same position
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- Map <leader>x to make a script executable
vim.keymap.set('n', '<leader>x', ':w<bar>!chmod +x %<cr>', { noremap = true, silent = true })

-- Map <leader>p to vim file explorer
vim.keymap.set('n', '<leader>pe', ':Ex<CR>', { noremap = true })

-- Map <leader>enter to open shell to insert command
vim.keymap.set('n', '<leader><CR>', ':!', { noremap = true })

-- Map <leader>enter to open shell to insert command
vim.keymap.set('n', '<leader>b', ':b#<CR>', { noremap = true })

-- Map <leader>so to source current file
vim.keymap.set('n', '<leader>so', ':source<CR>', { noremap = true })

-- Map Control+f to tmux-sessionizer
vim.keymap.set('n', '<C-f>', ':!tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })

-- Map <leader>i to remove all extra split screens and focus on the one with the cursor
vim.keymap.set('n', '<leader>i', ':only<CR>', { noremap = true })

-- Git push
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { noremap = true })

-- Git pull
vim.keymap.set('n', '<leader>gu', ':Git pull<CR>', { noremap = true })

-- Search commit messages ( git -log -S <pattern> )
vim.keymap.set('n', '<leader>gl', ':GcLog -S ', { noremap = true })

-- Map <leader>o to quit vim
vim.keymap.set('n', '<leader>o', ':q<CR>', { noremap = true })

-- Map <leader>w to save the current file
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })

-- Change word and go to next instance
vim.keymap.set('n', '<Leader>r', '*``cgn', {noremap = true})
vim.keymap.set('n', '<Leader>R', '*``cgN', {noremap = true})

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv", { noremap = true } )
vim.keymap.set("n", "N", "Nzzzv", { noremap = true } )

-- control+d and control+u will keep viewport centralized
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Map yp to yank a paragraph
vim.keymap.set('n', 'yp', 'yap:execute >normal! j/^$`<CR>P"<cr>', { noremap = true })

-- Replace line with yanked line
vim.keymap.set('n', 'dp', 'pkddyy', { noremap = true })

-- Map J and K to reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true } )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true } )

-- Select until end of line in visual mode 
vim.keymap.set('v', 'ç', '$', { noremap = true })

-- Copy into system clipboard
vim.keymap.set('n', '<Leader>y', '\"+yy', { noremap = true } , { desc = 'Yank to system clipboard n' } )
vim.keymap.set('v', '<Leader>y', '\"+y', { noremap = true } , { desc = 'Yank to system clipboard v' } )
vim.keymap.set('n', '<Leader>Y', '\"+Y', { noremap = true } , { desc = 'Yank line to system clipboard' } )

vim.keymap.set('n', '<Leader>pr', ':reg<CR>', { noremap = true } , { desc = 'List Registers' } )

vim.keymap.set('n', '<Leader>p0', '\"0p', { noremap = true }, { desc = 'Paste reg 0' } )
vim.keymap.set('n', '<Leader>p1', '\"1p', { noremap = true }, { desc = 'Paste reg 1' } )
vim.keymap.set('n', '<Leader>p2', '\"2p', { noremap = true }, { desc = 'Paste reg 2' } )
vim.keymap.set('n', '<Leader>p3', '\"3p', { noremap = true }, { desc = 'Paste reg 3' } )
vim.keymap.set('n', '<Leader>p4', '\"4p', { noremap = true }, { desc = 'Paste reg 4' } )
vim.keymap.set('n', '<Leader>p5', '\"5p', { noremap = true }, { desc = 'Paste reg 5' } )
vim.keymap.set('n', '<Leader>p6', '\"6p', { noremap = true }, { desc = 'Paste reg 6' } )
vim.keymap.set('n', '<Leader>p7', '\"7p', { noremap = true }, { desc = 'Paste reg 7' } )
vim.keymap.set('n', '<Leader>p8', '\"8p', { noremap = true }, { desc = 'Paste reg 8' } )
vim.keymap.set('n', '<Leader>p9', '\"9p', { noremap = true }, { desc = 'Paste reg 9' } )
