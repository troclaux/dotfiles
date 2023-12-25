-- Insert mode remaps

-- Map jk and kj to go to normal mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })

-- Delete whole word in insert mode
vim.keymap.set('i', '<C-Delete>', '<Esc>ldwi', { noremap = true })

-- Closes brackets automatically
vim.keymap.set('i', '{<CR>', '{<Esc>o<BS>}<Esc>ko', { noremap = true })

-- Visual mode remaps

-- Keep selection after indenting
vim.keymap.set("v", ">", ">gv", { noremap = true } )
vim.keymap.set("v", "<", "<gv", { noremap = true } )

-- Reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true } )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true } )

-- Select until start of line in visual mode 
vim.keymap.set('v', 'H', '^', { noremap = true })

-- Select until end of line in visual mode 
vim.keymap.set('v', 'L', '$', { noremap = true })

-- Paste system clipboard on visual mode
vim.keymap.set('v', '<Leader>p', '"+p==', { noremap = true })

-- Align text in visual mode around equals sign
vim.keymap.set('v', '<Leader>=', ':Tab /=<CR>', { noremap = true })


-- Normal mode remaps

-- Go to start of line
vim.keymap.set('n', 'H', '^', { noremap = true })

-- Go to end of line
vim.keymap.set('n', 'L', '$', { noremap = true })

-- Join current line with line below and keep cursor on same position
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- Reselect pasted text
vim.keymap.set('n', 'gp', '`[v`]', { noremap = true })

-- Select all
vim.keymap.set('n', '<Leader>a', 'GVgg', { noremap = true })

-- Keybind for tmux-sessionizer
vim.keymap.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>t', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv", { noremap = true } )
vim.keymap.set("n", "N", "Nzzzv", { noremap = true } )

-- Keep viewport centralized when using ctrl+d and ctrl+u
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Replace line with yanked line and keep saved line in register
vim.keymap.set('n', 'dp', 'pkddyy==', { noremap = true })

-- Paste and auto indent
vim.keymap.set('n', 'p', 'p==', { noremap = true })

-- Add semicolon to end of line in normal mode and return to previous position
vim.keymap.set('n', '<Leader>;', 'mzA;<Esc>`z', { noremap = true, desc = 'Add semicolon to end of line' })

-- Save the current file
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, desc = 'Save current file' })

-- Run last terminal command
vim.keymap.set('n', '<Leader>t', ':@:<CR>', { noremap = true, silent = true, desc = 'Run last terminal cmd'})

-- Change word and go to next instance
vim.api.nvim_set_keymap('n', '<Leader>rr', '*``cgn', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>RR', '*``cgN', {noremap = true})

-- Find and replace
vim.keymap.set('n', '<Leader>ss', ':%s/', { noremap = true })

-- Remove all extra split screens and focus on the one with the cursor
vim.keymap.set('n', '<Leader>i', ':only<CR>', { noremap = true })

-- Git push
vim.keymap.set('n', '<Leader>gp', ':Git push<CR>', { noremap = true })

-- Git pull
vim.keymap.set('n', '<Leader>gu', ':Git pull<CR>', { noremap = true })

-- Search commit messages ( git -log -S <pattern> )
vim.keymap.set('n', '<Leader>gl', ':GcLog -S ', { noremap = true })

-- Snippet to print yanked variable
vim.keymap.set('n', '<Leader>sc', 'mzoconsole.log( { <Esc>pA } );<Esc>`z', { noremap = true })

-- Split/Join line of code
vim.keymap.set('n', '<Leader>T', ':TSJToggle<CR>', { noremap = true, desc = 'Split/Join line of code'})

-- Quit vim
vim.keymap.set('n', '<Leader>o', ':q<CR>', { noremap = true })

-- Make a script executable
vim.keymap.set('n', '<Leader>x', ':w<bar>!chmod +x %<cr>', { noremap = true, silent = true })

-- Open vim file explorer
vim.keymap.set('n', '<Leader>pe', ':Ex<CR>', { noremap = true })

-- Toggle Tagbar extension
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { noremap = true })

-- Open shell to insert command
vim.keymap.set('n', '<Leader><CR>', ':!', { noremap = true })

-- Navigate buffers
vim.keymap.set('n', '<Leader>B', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>b', ':bprev<CR>', { noremap = true })

-- Source current file
vim.keymap.set('n', '<Leader>so', ':source<CR>', { noremap = true })

-- Copy into system clipboard
vim.keymap.set('n', '<Leader>y', '\"+yy', { noremap = true } , { desc = 'Yank to system clipboard n' } )
vim.keymap.set('v', '<Leader>y', '\"+y', { noremap = true } , { desc = 'Yank to system clipboard v' } )

-- Manage Registers
vim.keymap.set('n', '<Leader>pr', ':reg<CR>', { noremap = true } , { desc = 'List Registers' } )
vim.keymap.set('n', '<Leader>pp', '"+p==', { noremap = true } , { desc = 'Paste with system clipboard' } )
vim.keymap.set('n', '<Leader>PP', '"+P==', { noremap = true } , { desc = 'Paste with system clipboard' } )

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
