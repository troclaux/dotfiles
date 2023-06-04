-- Insert mode remaps

-- Map jk and kj to go to normal mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })

-- Map control+delete to delete whole word in insert mode
vim.keymap.set('i', '<C-Delete>', '<Esc>ldwi', { noremap = true })

-- Closes brackets automatically
vim.keymap.set('i', '{<CR>', '}<Esc>O{<Esc>o', { noremap = true })


-- Visual mode remaps

-- Keep selection after indenting
vim.keymap.set("v", ">", ">gv", { noremap = true } )
vim.keymap.set("v", "<", "<gv", { noremap = true } )

-- Map J and K to reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true } )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true } )

-- Select until end of line in visual mode 
vim.keymap.set('v', 'ç', '$', { noremap = true })


-- Normal mode remaps

-- Go to end of line and delete until end of line
vim.keymap.set('n', 'ç', '$', { noremap = true })
vim.keymap.set('n', 'dç', 'd$', { noremap = true })
vim.keymap.set('n', 'yç', 'y$', { noremap = true })

-- Join current line with line below and keep cursor on same position
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- Map Control+f to tmux-sessionizer
vim.keymap.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-f>', ':silent !tmux neww tmux-vimionizer<CR>', { noremap = true, silent = true })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv", { noremap = true } )
vim.keymap.set("n", "N", "Nzzzv", { noremap = true } )

-- control+d and control+u will keep viewport centralized
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Replace line with yanked line and keep saved line in register
vim.keymap.set('n', 'dp', 'pkddyy', { noremap = true })

-- Map <leader>w to save the current file
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })

-- Change word and go to next instance
vim.api.nvim_set_keymap('n', '<Leader>r', '*``cgn', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>R', '*``cgN', {noremap = true})

-- Find and replace
vim.keymap.set('n', '<leader>ss', ':%s/', { noremap = true })

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

-- Map <leader>x to make a script executable
vim.keymap.set('n', '<leader>x', ':w<bar>!chmod +x %<cr>', { noremap = true, silent = true })

-- Map <leader>pe to vim file explorer
vim.keymap.set('n', '<leader>pe', ':Ex<CR>', { noremap = true })

-- Map <leader>enter to open shell to insert command
vim.keymap.set('n', '<leader><CR>', ':!', { noremap = true })

-- Map <leader>n to swith buffers
vim.keymap.set('n', '<leader>b', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>B', ':bprev<CR>', { noremap = true })

-- Map <leader>so to source current file
vim.keymap.set('n', '<leader>so', ':source<CR>', { noremap = true })

-- Copy into system clipboard
vim.keymap.set('n', '<Leader>y', '\"+yy', { noremap = true } , { desc = 'Yank to system clipboard n' } )
vim.keymap.set('v', '<Leader>y', '\"+y', { noremap = true } , { desc = 'Yank to system clipboard v' } )
vim.keymap.set('n', '<Leader>Y', '\"+Y', { noremap = true } , { desc = 'Yank line to system clipboard' } )

-- Manage Registers
vim.keymap.set('n', '<Leader>pr', ':reg<CR>', { noremap = true } , { desc = 'List Registers' } )
vim.keymap.set('n', '<Leader>pp', 'o<Esc>"+p=', { noremap = true } , { desc = 'Paste with system clipboard' } )
vim.keymap.set('n', '<Leader>PP', 'O<Esc>"+p=', { noremap = true } , { desc = 'Paste with system clipboard' } )


vim.keymap.set('n', '<Leader>p0', '\"0p', { noremap = true } )
vim.keymap.set('n', '<Leader>p1', '\"1p', { noremap = true } )
vim.keymap.set('n', '<Leader>p2', '\"2p', { noremap = true } )
vim.keymap.set('n', '<Leader>p3', '\"3p', { noremap = true } )
vim.keymap.set('n', '<Leader>p4', '\"4p', { noremap = true } )
vim.keymap.set('n', '<Leader>p5', '\"5p', { noremap = true } )
vim.keymap.set('n', '<Leader>p6', '\"6p', { noremap = true } )
vim.keymap.set('n', '<Leader>p7', '\"7p', { noremap = true } )
vim.keymap.set('n', '<Leader>p8', '\"8p', { noremap = true } )
vim.keymap.set('n', '<Leader>p9', '\"9p', { noremap = true } )

vim.keymap.set('n', '<Leader>P0', '\"0P', { noremap = true } )
vim.keymap.set('n', '<Leader>P1', '\"1P', { noremap = true } )
vim.keymap.set('n', '<Leader>P2', '\"2P', { noremap = true } )
vim.keymap.set('n', '<Leader>P3', '\"3P', { noremap = true } )
vim.keymap.set('n', '<Leader>P4', '\"4P', { noremap = true } )
vim.keymap.set('n', '<Leader>P5', '\"5P', { noremap = true } )
vim.keymap.set('n', '<Leader>P6', '\"6P', { noremap = true } )
vim.keymap.set('n', '<Leader>P7', '\"7P', { noremap = true } )
vim.keymap.set('n', '<Leader>P8', '\"8P', { noremap = true } )
vim.keymap.set('n', '<Leader>P9', '\"9P', { noremap = true } )
