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

-- Select until end of line in visual mode 
vim.keymap.set('v', 'ç', '$', { noremap = true })

-- Paste system clipboard on visual mode
vim.keymap.set('v', '<Leader>p', '"+p', { noremap = true })

-- Align text in visual mode around equals sign
vim.keymap.set('v', '<Leader>=', ':Tab /=<CR>', { noremap = true })


-- Normal mode remaps

-- Go to end of line
vim.keymap.set('n', 'ç', '$', { noremap = true })

-- Join current line with line below and keep cursor on same position
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- Reselect pasted text
vim.keymap.set('n', 'gp', '`[v`]', { noremap = true })

-- Keybind for tmux-sessionizer
vim.keymap.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>t', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv", { noremap = true } )
vim.keymap.set("n", "N", "Nzzzv", { noremap = true } )

-- Keep viewport centralized when using ctrl+d and ctrl+u
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Replace line with yanked line and keep saved line in register
vim.keymap.set('n', 'dp', 'pkddyy', { noremap = true })

-- Save the current file
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true })

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

-- Quit vim
vim.keymap.set('n', '<Leader>o', ':q<CR>', { noremap = true })

-- Make a script executable
vim.keymap.set('n', '<Leader>x', ':w<bar>!chmod +x %<cr>', { noremap = true, silent = true })

-- Open vim file explorer
vim.keymap.set('n', '<Leader>pe', ':Ex<CR>', { noremap = true })

-- Open shell to insert command
vim.keymap.set('n', '<Leader><CR>', ':!', { noremap = true })

-- Navigate buffers
vim.keymap.set('n', '<Leader>b', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>B', ':bprev<CR>', { noremap = true })

-- Source current file
vim.keymap.set('n', '<Leader>so', ':source<CR>', { noremap = true })

-- Copy into system clipboard
vim.keymap.set('n', '<Leader>y', '\"+yy', { noremap = true } , { desc = 'Yank to system clipboard n' } )
vim.keymap.set('v', '<Leader>y', '\"+y', { noremap = true } , { desc = 'Yank to system clipboard v' } )

-- Manage Registers
vim.keymap.set('n', '<Leader>rp', ':reg<CR>', { noremap = true } , { desc = 'List Registers' } )
vim.keymap.set('n', '<Leader>p', '"+p', { noremap = true } , { desc = 'Paste with system clipboard' } )


vim.keymap.set('n', '<Leader>r0', '\"0p', { noremap = true } )
vim.keymap.set('n', '<Leader>r1', '\"1p', { noremap = true } )
vim.keymap.set('n', '<Leader>r2', '\"2p', { noremap = true } )
vim.keymap.set('n', '<Leader>r3', '\"3p', { noremap = true } )
vim.keymap.set('n', '<Leader>r4', '\"4p', { noremap = true } )
vim.keymap.set('n', '<Leader>r5', '\"5p', { noremap = true } )
vim.keymap.set('n', '<Leader>r6', '\"6p', { noremap = true } )
vim.keymap.set('n', '<Leader>r7', '\"7p', { noremap = true } )
vim.keymap.set('n', '<Leader>r8', '\"8p', { noremap = true } )
vim.keymap.set('n', '<Leader>r9', '\"9p', { noremap = true } )

vim.keymap.set('n', '<Leader>R0', '\"0P', { noremap = true } )
vim.keymap.set('n', '<Leader>R1', '\"1P', { noremap = true } )
vim.keymap.set('n', '<Leader>R2', '\"2P', { noremap = true } )
vim.keymap.set('n', '<Leader>R3', '\"3P', { noremap = true } )
vim.keymap.set('n', '<Leader>R4', '\"4P', { noremap = true } )
vim.keymap.set('n', '<Leader>R5', '\"5P', { noremap = true } )
vim.keymap.set('n', '<Leader>R6', '\"6P', { noremap = true } )
vim.keymap.set('n', '<Leader>R7', '\"7P', { noremap = true } )
vim.keymap.set('n', '<Leader>R8', '\"8P', { noremap = true } )
vim.keymap.set('n', '<Leader>R9', '\"9P', { noremap = true } )
