-- Insert mode remaps --

-- Map jk and kj to go to normal mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

-- Closes brackets automatically
vim.keymap.set("i", "{<CR>", "{<Esc>o<BS>}<Esc>ko", { noremap = true, desc = "Close brackets automatically" })

-- Visual mode remaps --

-- Keep selection after indenting
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

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
vim.keymap.set("n", "H", "^", { noremap = true, desc = "Go to start of line" })

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
vim.keymap.set("n", "dp", "pkddyy==", { noremap = true })

-- Paste and indent pasted text
vim.keymap.set("n", "p", "p`[v`]=", { noremap = true })
vim.keymap.set("n", "P", "P`[v`]=", { noremap = true })

-- Add semicolon to end of line in normal mode and return to previous position
vim.keymap.set("n", "<Leader>;", "mzA;<Esc>`z", { noremap = true, desc = "Add semicolon to end of line" })

-- Save the current file
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, desc = "Save current file" })

-- Run last terminal command
vim.keymap.set("n", "<Leader>t", ":@:<CR>", { noremap = true, silent = true, desc = "Run last terminal cmd" })

-- Change word and go to next instance
vim.api.nvim_set_keymap("n", "<Leader>rr", "*``cgn", { noremap = true, desc = "Replace word and go to next instance" })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>RR",
	"*``cgN",
	{ noremap = true, desc = "Replace word and go to previous instance" }
)

-- Search and replace
vim.keymap.set("n", "<Leader>ss", ":%s/", { noremap = true, desc = "Search and replace command" })

-- Split/Join line of code
vim.keymap.set("n", "<Leader>T", ":TSJToggle<CR>", { noremap = true, desc = "Split/Join line of code" })

-- Quit vim
vim.keymap.set("n", "<Leader>o", ":q<CR>", { noremap = true, desc = "Quit vim" })

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
vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true })

-- Open shell to insert command
vim.keymap.set("n", "<Leader><CR>", ":!", { noremap = true })
-- Change to current buffer's parent directory and run command
vim.keymap.set(
	"n",
	"<Leader>cd",
	":!cd %:p:h && ",
	{ noremap = true, desc = "Change to current buffer's parent directory" }
)

-- Navigate buffers
vim.keymap.set("n", "<Leader>B", ":bnext<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>b", ":bprev<CR>", { noremap = true })

-- Source current file
vim.keymap.set("n", "<Leader>so", ":source<CR>", { noremap = true })

-- Copy into system clipboard
vim.keymap.set("n", "<Leader>y", '"+yy', { noremap = true, desc = "Yank to system clipboard n" })
vim.keymap.set("v", "<Leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard v" })

-- Manage Registers
vim.keymap.set("n", "<Leader>pr", ":reg<CR>", { noremap = true, desc = "List Registers" })
vim.keymap.set("n", "<Leader>pp", '"+p==', { noremap = true, desc = "Paste with system clipboard" })
vim.keymap.set("n", "<Leader>PP", '"+P==', { noremap = true, desc = "Paste with system clipboard" })

vim.keymap.set("n", "<Leader>p0", '"0p', { noremap = true })
vim.keymap.set("n", "<Leader>p1", '"1p', { noremap = true })
vim.keymap.set("n", "<Leader>p2", '"2p', { noremap = true })
vim.keymap.set("n", "<Leader>p3", '"3p', { noremap = true })
vim.keymap.set("n", "<Leader>p4", '"4p', { noremap = true })
vim.keymap.set("n", "<Leader>p5", '"5p', { noremap = true })
vim.keymap.set("n", "<Leader>p6", '"6p', { noremap = true })
vim.keymap.set("n", "<Leader>p7", '"7p', { noremap = true })
vim.keymap.set("n", "<Leader>p8", '"8p', { noremap = true })
vim.keymap.set("n", "<Leader>p9", '"9p', { noremap = true })

vim.keymap.set("n", "<Leader>P0", '"0P', { noremap = true })
vim.keymap.set("n", "<Leader>P1", '"1P', { noremap = true })
vim.keymap.set("n", "<Leader>P2", '"2P', { noremap = true })
vim.keymap.set("n", "<Leader>P3", '"3P', { noremap = true })
vim.keymap.set("n", "<Leader>P4", '"4P', { noremap = true })
vim.keymap.set("n", "<Leader>P5", '"5P', { noremap = true })
vim.keymap.set("n", "<Leader>P6", '"6P', { noremap = true })
vim.keymap.set("n", "<Leader>P7", '"7P', { noremap = true })
vim.keymap.set("n", "<Leader>P8", '"8P', { noremap = true })
vim.keymap.set("n", "<Leader>P9", '"9P', { noremap = true })

-- Language specific Snippets

-- Golang Snippets

-- Javascript Snippets --

-- Snippet to print yanked variable in Javascript
vim.keymap.set(
	"n",
	"<Leader>pj",
	"mzoconsole.log( { <Esc>pA } );<Esc>`z",
	{ noremap = true, desc = "Insert print Statement in Javascript" }
)

-- Python Snippets --
