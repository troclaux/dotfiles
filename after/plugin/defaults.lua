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
vim.keymap.set('n', '<leader>p', ':Ex<CR>', { noremap = true })

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
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- control+d and control+u will keep viewport centralized
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Map yp to yank a paragraph
vim.keymap.set('n', 'yp', 'yap:execute >normal! j/^$`<cr>P"<cr>', { noremap = true })

-- Replace line with yanked line
vim.keymap.set('n', 'dp', 'pkddyy', { noremap = true })

-- Map J and K to reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Select until end of line in visual mode 
vim.keymap.set('v', 'ç', '$', { noremap = true })

-- Copy into system clipboard
vim.keymap.set('n', '<Leader>y', '\"+yy')
vim.keymap.set('v', '<Leader>y', '\"+y')
vim.keymap.set('n', '<Leader>Y', '\"+Y')
