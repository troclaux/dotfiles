-- Deleted lazyvim keymaps

vim.keymap.del("n", "<Leader>ww")
vim.keymap.del("n", "<Leader>w-")
vim.keymap.del("n", "<Leader>w|")
vim.keymap.del("n", "<Leader>wd")

-- Insert mode remaps --

-- Map jk and kj to go to normal mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

-- Visual mode remaps --

-- Keep selection after indenting
-- vim.keymap.set("v", ">", ">gv", { noremap = true } )
-- vim.keymap.set("v", "<", "<gv", { noremap = true } )

-- Reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move selection up" })

-- Select until start of line in visual mode
vim.keymap.set("v", "H", "^", { noremap = true, desc = "Go to start of line" })

-- Keep buffer after pasting over selection
vim.keymap.set("v", "p", "p`[v`]y", { noremap = true, desc = "Go to start of line" })

-- Select until end of line in visual mode
vim.keymap.set("v", "L", "$", { noremap = true, desc = "Go to end of line" })

-- Paste system clipboard on visual mode
vim.keymap.set("v", "<Leader>p", '"+pgv=_', { noremap = true, desc = "Paste with System clipboard" })

-- Align text in visual mode around equals sign
vim.keymap.set("v", "<Leader>=", ":!column -t<CR>gv=", { noremap = true, desc = "Column Align" })

-- Select all
vim.keymap.set("v", "<Leader>a", "<Esc>GVgg", { noremap = true, desc = "Select all" })

-- Normal mode remaps --

-- Go to start of line
vim.keymap.set("n", "H", "_", { noremap = true, desc = "Go to start of line" })

-- Go to end of line
vim.keymap.set("n", "L", "$", { noremap = true, desc = "Go to end of line" })

-- Join current line with line below and keep cursor on same position
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", { noremap = true, desc = "Reselect pasted text" })

-- Select all
vim.keymap.set("n", "<Leader>a", "GVgg", { noremap = true, desc = "Select all text" })

-- Keybind for tmux-sessionizer
vim.keymap.set(
	"n",
	"<C-f>",
	"<cmd>silent !tmux neww tmux-sessionizer<CR>",
	{ noremap = true, desc = "tmux sessionizer" }
)
-- vim.keymap.set('n', '<Leader>t', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { noremap = true })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- Keep viewport centralized when using ctrl+d and ctrl+u
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })

-- Replace line with yanked line and keep saved line in register
-- vim.keymap.set("n", "dp", "pkddyy==", { noremap = true })

-- Paste and indent pasted text
-- vim.keymap.set("n", "p", "p`[v`]=", { noremap = true })
-- vim.keymap.set("n", "P", "P`[v`]=", { noremap = true })

-- Add semicolon to end of line in normal mode and return to previous position
vim.keymap.set("n", "<Leader>;", "mzA;<Esc>`z", { noremap = true, desc = "Add semicolon to end of line" })

-- Run last terminal command
vim.keymap.set("n", "<Leader>t", ":@:<CR>", { noremap = true, silent = true, desc = "Run last terminal cmd" })

-- Change word and go to next instance
vim.keymap.set("n", "<Leader>rr", "*``cgn", { noremap = true, desc = "Replace word and go to next instance" })

-- Search and replace
vim.keymap.set("n", "<Leader>ss", ":%s/", { noremap = true, desc = "Search and replace command" })

-- Split/Join line of code
-- vim.keymap.set("n", "<Leader>T", ":TSJToggle<CR>", { noremap = true, desc = "Split/Join line of code" })

-- Quit vim
vim.keymap.set("n", "<Leader>o", ":q<CR>", { noremap = true, desc = "Quit vim" })

-- Save current buffer
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, desc = "Save current buffer" })

-- Make a script executable
vim.keymap.set(
	"n",
	"<Leader>x",
	":w<bar>!chmod +x %<cr>",
	{ noremap = true, desc = "Make script executable", silent = true }
)

-- Open vim file explorer
vim.keymap.set("n", "<Leader>e", ":Ex<CR>", { noremap = true, desc = "Open vim file explorer" })

-- Toggle Tagbar extension
-- vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true })

-- Open shell to insert command
vim.keymap.set("n", "<Leader><CR>", ":!", { noremap = true })
-- Change to current buffer's parent directory and run command
vim.keymap.set(
	"n",
	"<Leader>cd",
	":!cd %:p:h && ",
	{ noremap = true, desc = "Change to current buffer's parent directory" }
)

-- Source current file
vim.keymap.set("n", "<Leader>so", ":source<CR>", { noremap = true })
