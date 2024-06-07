-- Delete lazyvim keymaps --

-- vim.keymap.del("n", "<Leader>l")

-- Insert mode remaps --

-- Automatically closes curly braces
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- Visual mode remaps --

-- Move visual selection up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Select until start of line in visual mode
vim.keymap.set("v", "H", "_", { desc = "Go to start of line" })

-- Keep buffer after pasting over selection
vim.keymap.set("v", "p", "p`[v`]y")

-- Select until end of line in visual mode
vim.keymap.set("v", "L", "g_", { desc = "Go to end of line" })

-- Align text in visual mode around equals sign
vim.keymap.set("v", "<Leader>=", ":!column -t<CR>gv=", { desc = "Column Align" })

-- Select all
vim.keymap.set("v", "<Leader>a", "<Esc>GVgg", { desc = "Select all" })

-- Search and replace
vim.keymap.set("v", "<Leader>se", ":s/", { desc = "Search and replace command" })

-- run normal command on visual selection
vim.keymap.set("v", "<Leader>n", ":normal ", { desc = "Run normal mode command" })

-- run macro on visual selection
vim.keymap.set("v", "<Leader>m", ":normal @w<CR>", { desc = "Run macro on visual selection" })

-- Normal mode remaps --

-- Go to start of line
vim.keymap.set("n", "H", "_", { desc = "Go to start of line" })

-- Go to end of line
vim.keymap.set("n", "L", "$", { desc = "Go to end of line" })

-- Join current line with line below and keep cursor on same position
vim.keymap.set("n", "J", "mzJ`z")

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Reselect pasted text" })

-- Select all
vim.keymap.set("n", "<Leader>a", "GVgg", { desc = "Select all text" })

-- Select line without newline
vim.keymap.set("n", "vil", "^vg_", { desc = "Select line without newline" })

-- Yank line without newline
vim.keymap.set("n", "yil", "^vg_y", { desc = "Yank line without newline" })

-- Insert a newline before pasting register content
vim.keymap.set("n", "<Leader>pp", 'o<Esc>0"_Dp==', { desc = "Add newline and paste" })

-- Keybind for tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux sessionizer" })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Go to previous buffer
vim.keymap.set("n", "<C-b>", "<C-^>", { desc = "Go to previous buffer" })

-- Keep viewport centralized when using ctrl+d and ctrl+u
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Run last terminal command
vim.keymap.set("n", "<Leader>T", ":@:<CR>", { silent = true, desc = "Run last terminal cmd" })

-- Change word and go to next instance
vim.keymap.set("n", "<Leader>r", "*``cgn", { desc = "Replace word and go to next instance" })

-- Search and replace
vim.keymap.set("n", "<Leader>se", ":%s/", { desc = "Search and replace command" })

-- Quit nvim
vim.keymap.set("n", "<Leader>o", ":q<CR>", { desc = "Quit vim" })

-- Save current buffer
vim.keymap.set("n", "<Leader>i", ":w<CR>", { desc = "Save current buffer" })

-- Add blank line above or below
vim.keymap.set("n", "[ ", 'mzO<Esc>0"_D`z', { desc = "Add blank line above" })
vim.keymap.set("n", "] ", 'mzo<Esc>0"_D`z', { desc = "Add blank line below" })

-- Open vim file explorer
vim.keymap.set("n", "<Leader>e", ":Ex<CR>", { desc = "Open vim file explorer" })

-- Open shell to insert command
vim.keymap.set("n", "<Leader><CR>", ":!")

-- My snippets --

-- Markdown heading
vim.keymap.set("n", "<Leader>pc", "mzO```<Esc>jo```<Esc>`z", { desc = "Surround with ```" })
vim.keymap.set("v", "<Leader>pc", "omzo<Esc>o```<Esc>`zO```<Esc>A", { desc = "Surround with ```" })

vim.keymap.set("n", "<Leader>1", "o<Esc>0Di# ", { desc = "Insert markdown heading #" })
vim.keymap.set("n", "<Leader>2", "o<Esc>0Di## ", { desc = "Insert markdown heading ##" })
vim.keymap.set("n", "<Leader>3", "o<Esc>0Di### ", { desc = "Insert markdown heading ###" })

vim.keymap.set("n", "<Leader>pf", "o- [ ] ", { desc = "Insert markdown form" })


-- Plugin keymaps --

-- Access lazy.vim menu
vim.keymap.set("n", "<Leader>L", ":Lazy<CR>", { desc = "Lazy.nvim menu" })

-- Access lazy.vim menu
vim.keymap.set("n", "<Leader>E", ":LazyExtras<CR>", { desc = "Lazy.nvim extra plugins" })

-- Access Mason menu
vim.keymap.set("n", "<Leader>M", ":Mason<CR>", { desc = "Access Mason menu" })

-- Show nvim's startup time
vim.keymap.set("n", "<Leader>S", ":StartupTime<CR>", { desc = "Show nvim's startup time" })

-- Update nvim plugins
vim.keymap.set("n", "<Leader>U", ":Lazy update<CR>", { desc = "Update nvim plugins" })

-- Vim-fugitive plugin
vim.keymap.set("n", "<leader>gi", ":vert Git<CR>", { desc = "Git Status" })
-- vim.keymap.set("n", "<leader>gi", vim.cmd.Git, { desc = "Git Status" })
vim.keymap.set("n", "<Leader>gp", ":Git push<CR>", { desc = "Git Push" })
vim.keymap.set("n", "<Leader>gl", ":GcLog -S ", { desc = "Search git commit messages" })

vim.keymap.set("n", "gh", "<C>diffget //2<CR>")
vim.keymap.set("n", "gl", "<C>diffget //3<CR>")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = "Harpoon mark" })
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>C", mark.clear_all, { desc = "Harpoon clear marks" })

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

-- Split/Join line of code
vim.keymap.set("n", "<Leader>t", require("treesj").toggle, { desc = "Split/Join line of code" })

-- Make a script executable
vim.keymap.set("n", "<Leader>X", ":w<bar>!chmod +x %<CR>", { desc = "Make script executable", silent = true })

-- Show current buffer summary
vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { desc = "Show current buffer summary" })

-- Move argument/parameter left/right
vim.keymap.set("n", "cl", ":SidewaysRight<CR>", { desc = "Move argument/parameter right" })
vim.keymap.set("n", "ch", ":SidewaysLeft<CR>", { desc = "Move argument/parameter left" })

-- Change to current buffer's parent directory and run command
-- vim.keymap.set("n", "<Leader>cd", ":!cd %:p:h && ", { desc = "Change to current buffer's parent directory" })

-- vim.keymap.set("n", "<leader>gi", ":G | on<CR>", { desc = "Git Status" })
-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })

-- vim.keymap.set("v", "S", "<nop>", { noremap = true })
