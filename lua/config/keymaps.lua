-- Deleted lazyvim keymaps

vim.keymap.del("n", "<Leader>l")

-- Insert mode remaps --

-- Map jk and kj to go to normal mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })
-- vim.keymap.set("v", "S", "<nop>", { noremap = true })

-- Visual mode remaps --

-- Reposition highlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move selection up" })

-- Select until start of line in visual mode
vim.keymap.set("v", "H", "_", { noremap = true, desc = "Go to start of line" })

-- Keep buffer after pasting over selection
vim.keymap.set("v", "p", "p`[v`]y", { noremap = true, desc = "Go to start of line" })

-- Select until end of line in visual mode
vim.keymap.set("v", "L", "$h", { noremap = true, desc = "Go to end of line" })

-- Align text in visual mode around equals sign
vim.keymap.set("v", "<Leader>=", ":!column -t<CR>gv=", { noremap = true, desc = "Column Align" })

-- Select all
vim.keymap.set("v", "<Leader>a", "<Esc>GVgg", { noremap = true, desc = "Select all" })

-- Search and replace
vim.keymap.set("v", "<Leader>se", ":s/", { noremap = true, desc = "Search and replace command" })

-- run normal command on visual selection
vim.keymap.set("v", "<Leader>n", ":normal ", { noremap = true, desc = "Run normal mode command" })

-- Normal mode remaps --

-- Go to start of line
vim.keymap.set("n", "H", "_", { noremap = true, desc = "Go to start of line" })

-- Go to end of line
vim.keymap.set("n", "L", "$", { noremap = true, desc = "Go to end of line" })

-- Join current line with line below and keep cursor on same position
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", { noremap = true, desc = "Reselect pasted text" })

-- Go to previous buffer
vim.keymap.set("n", "<C-b>", "<C-^>", { noremap = true, desc = "Go to previous buffer" })

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

vim.keymap.set("n", "<Leader>b", "<C-^>", { noremap = true, desc = "Go to previous buffer" })

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
vim.keymap.set("n", "<Leader>se", ":%s/", { noremap = true, desc = "Search and replace command" })

-- Split/Join line of code
-- vim.keymap.set("n", "<Leader>T", ":TSJToggle<CR>", { noremap = true, desc = "Split/Join line of code" })

-- Quit vim
vim.keymap.set("n", "<Leader>o", ":q<CR>", { noremap = true, desc = "Quit vim" })

-- Save current buffer
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, desc = "Save current buffer" })

-- Add blank line above or below
vim.keymap.set("n", "[ ", "mzO<Esc>`z", { noremap = true, desc = "Add blank line above" })
vim.keymap.set("n", "] ", "mzo<Esc>`z", { noremap = true, desc = "Add blank line below" })

-- Make a script executable
vim.keymap.set(
	"n",
	"<Leader>xx",
	":w<bar>!chmod +x %<cr>",
	{ noremap = true, desc = "Make script executable", silent = true }
)

-- Open vim file explorer
vim.keymap.set("n", "<Leader>e", ":Ex<CR>", { noremap = true, desc = "Open vim file explorer" })

-- Toggle Tagbar extension
-- vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true })

-- Open shell to insert command
vim.keymap.set("n", "<Leader><CR>", ":!", { noremap = true })

-- Select all
vim.keymap.set("v", "<Leader>a", "VGgg", { noremap = true, desc = "Select all" })

-- Change to current buffer's parent directory and run command
vim.keymap.set(
	"n",
	"<Leader>cd",
	":!cd %:p:h && ",
	{ noremap = true, desc = "Change to current buffer's parent directory" }
)

-- Source current file
vim.keymap.set("n", "<Leader>so", ":source<CR>", { noremap = true })

-- Plugin keymaps

vim.keymap.set("n", "<leader>gi", vim.cmd.Git, { desc = "Git Status" })
vim.keymap.set("n", "<leader>v", vim.cmd.Git, { desc = "Git Status" })
-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
vim.keymap.set("n", "<Leader>gp", ":Git push<CR>", { noremap = true, desc = "Git Push" })
vim.keymap.set("n", "<Leader>gu", ":Git pull<CR>", { noremap = true, desc = "Git Pull" })
vim.keymap.set("n", "<Leader>gl", ":GcLog -S ", { noremap = true, desc = "Search git commit messages" })

vim.keymap.set("n", "gh", "<C>diffget //2<CR>")
vim.keymap.set("n", "gl", "<C>diffget //3<CR>")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = "Harpoon mark" })
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>cc", mark.clear_all, { desc = "Harpoon clear marks" })

vim.keymap.set("n", "<leader>h", function()
	ui.nav_file(1)
end, { desc = "Navigate mark 1" })
vim.keymap.set("n", "<leader>j", function()
	ui.nav_file(2)
end, { desc = "Navigate mark 2" })
vim.keymap.set("n", "<leader>k", function()
	ui.nav_file(3)
end, { desc = "Navigate mark 3" })
vim.keymap.set("n", "<leader>l", function()
	ui.nav_file(4)
end, { desc = "Navigate mark 4" })
