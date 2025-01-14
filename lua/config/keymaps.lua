-------------------------
-- INSERT MODE KEYMAPS --

-- Automatically closes curly braces
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-------------------------
-- VISUAL MODE KEYMAPS --

-- Select until start of line in visual mode
vim.keymap.set("v", "H", "^", { desc = "Go to start of line" })

-- Select until end of line in visual mode
vim.keymap.set("v", "L", "g_", { desc = "Go to end of line" })

-- Keep buffer after pasting over selection
vim.keymap.set("v", "p", "p`[v`]y")

-- Search and replace
vim.keymap.set("v", "<Leader>r", ":s/", { desc = "Search and replace command" })

-- run normal command on visual selection
vim.keymap.set("v", "<Leader>n", ":norm ", { desc = "Run normal mode command" })
vim.keymap.set("v", "<Leader>m", ":norm @w<CR>", { desc = "Run macro" })

-------------------------
-- NORMAL MODE KEYMAPS --

-- Go to start of line
vim.keymap.set("n", "H", "^", { desc = "Go to start of line" })

-- Go to end of line
vim.keymap.set("n", "L", "$", { desc = "Go to end of line" })

-- Go to middle of line
vim.keymap.set("n", "M", "gM", { desc = "Go to middle of line" })

-- Join current line with line below and keep cursor on same position
vim.keymap.set("n", "J", "mzJ`z")

-- Search
vim.keymap.set("n", "<A-f>", "/", { desc = "Search" })

-- Switch window
vim.keymap.set("n", "<Tab>", "<C-w>w", { desc = "Switch window" })

-- Close all other windows
vim.keymap.set("n", "ç", "<C-w>o", { desc = "Close all other windows" })

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Reselect pasted text" })

-- Insert a newline before pasting register content
vim.keymap.set("n", "<Leader>pp", 'o<Esc>0"_Dp==', { desc = "Add newline and paste" })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Go to previous buffer
vim.keymap.set("n", "<C-b>", "<C-^>", { desc = "Go to previous buffer" })

-- Keep viewport centralized when using ctrl+d and ctrl+u
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Change word and go to next instance
vim.keymap.set("n", "<Leader>R", "*``cgn", { desc = "Replace word and go to next instance" })

-- Search and replace
vim.keymap.set("n", "<Leader>r", ":%s/", { desc = "Search and replace command" })

-- Search and replace
vim.keymap.set("n", "<Leader>W", [[mz:%s/\s\+$//e<CR>`z]], { desc = "Remove Trailing Whitespace" })

-- Quit nvim
vim.keymap.set("n", "<Leader>o", ":q<CR>", { desc = "Quit vim" })

-- Save current buffer
vim.keymap.set("n", "<Leader>i", ":w<CR>", { desc = "Save current buffer" })

-- Add blank line above/below
vim.keymap.set("n", "<Leader>[", 'mzO<Esc>0"_D`z', { desc = "Add blank line before" })
vim.keymap.set("n", "<Leader>]", 'mzo<Esc>0"_D`z', { desc = "Add blank line after" })
vim.keymap.set("n", "<Leader><CR>", 'mzO<Esc>0"_D`zo<Esc>0"_D`z', { desc = "Add blank line below and after" })

-- Open vim file explorer
vim.keymap.set("n", "<Leader>e", "<CMD>Oil<CR>", { desc = "Open file explorer" })

-- Go to left window and close all other windows
vim.keymap.set("n", "\\", "<C-w>h<C-w>h<C-w>o", { desc = "Go to left window and close all other windows" })

-- Apply title case
vim.keymap.set("n", "<Leader>tc", [[mz:s/\<./\u&/g<CR>:nohlsearch<CR>`z]], { desc = "Convert to title case" })

-- Keybind for tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux sessionizer" })

-- Open new tmux window in the parent folder of current buffer
vim.keymap.set("n", "<Leader>tm", function()
	local parent_dir = vim.fn.expand("%:p:h")
	local cmd = "tmux neww -c " .. parent_dir
	vim.fn.system(cmd)
end, { desc = "Open tmux window in parent directory" })

----------------------
-- SNIPPETS KEYMAPS --
----------------------

-- Bash
vim.keymap.set("n", "<Leader>ps", "mzO#!/bin/bash<CR><Esc>`z", { desc = "Insert shebang statement" })

-- Markdown
vim.keymap.set("n", "<Leader>pf", "o- [ ] ", { desc = "Insert markdown form" })
vim.keymap.set("n", "<Leader>pc", "p`[v`]omzo<Esc>o<Esc>S```<Esc>`zO```", { desc = "Paste and surround with ```" })
vim.keymap.set("v", "<Leader>pc", "omzo<Esc>o```<Esc>`zO```", { desc = "Surround with ```" })
vim.keymap.set("n", "<leader>pi", function()
	local text = vim.fn.getreg("+")
	text = text:gsub("^%s+", ""):gsub("%s+$", "")
	local surrounded = "`" .. text .. "`"
	vim.api.nvim_put({ surrounded }, "c", true, true)
end, { desc = "Paste text and surround with backticks" })

vim.keymap.set("n", "<Leader>1", 'o<Esc>0"_Di# ', { desc = "Insert markdown heading #" })
vim.keymap.set("n", "<Leader>2", 'o<Esc>0"_Di## ', { desc = "Insert markdown heading ##" })
vim.keymap.set("n", "<Leader>3", 'o<Esc>0"_Di### ', { desc = "Insert markdown heading ###" })
vim.keymap.set("n", "<Leader>4", 'o<Esc>0"_Di#### ', { desc = "Insert markdown heading ####" })

-- Golang
vim.keymap.set("n", "<leader>pe", "oif err != nil {<CR>return , err<CR>}<Esc>kf,i", { desc = "golang error" })
vim.keymap.set("n", "<leader>pg", 'oimport "fmt"<Esc>hhh', { desc = "golang import single package" })
vim.keymap.set("n", "<leader>pG", 'oimport (<CR>"fmt"<CR>)<Esc>ko""<Esc>i', { desc = "golang import packages" })

--------------------
-- PLUGIN KEYMAPS --
--------------------

-- Access lazy.vim menu
vim.keymap.set("n", "<Leader>L", vim.cmd.Lazy, { desc = "Lazy.nvim menu" })

-- View lazy.vim extra plugins
vim.keymap.set("n", "<Leader>E", vim.cmd.LazyExtras, { desc = "Lazy.nvim extra plugins" })

-- Access Mason menu
vim.keymap.set("n", "<Leader>M", vim.cmd.Mason, { desc = "Access Mason menu" })

-- Update nvim plugins
vim.keymap.set("n", "<Leader>U", ":Lazy update<CR>", { desc = "Update nvim plugins" })

-- Undotree plugin
vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree panel" })

-- Show current buffer summary
vim.keymap.set("n", "<F8>", vim.cmd.TagbarOpenAutoClose, { desc = "Show current buffer summary" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open file explorer" })

-- Vim-fugitive plugin
vim.keymap.set("n", "<leader>gi", ":vert Git<CR>", { desc = "Git Status" })
-- vim.keymap.set("n", "<leader>gi", vim.cmd.Git, { desc = "Git Status" })
vim.keymap.set("n", "<Leader>gp", ":Git push<CR>", { desc = "Git Push" })
vim.keymap.set("n", "<Leader>gl", ":GcLog -S ", { desc = "Search git commit messages" })

vim.keymap.set("n", "gh", "<C>diffget //2<CR>")
vim.keymap.set("n", "gl", "<C>diffget //3<CR>")

-- Harpoon plugin
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = "Harpoon mark" })
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>C", mark.clear_all, { desc = "Harpoon clear marks" })

vim.keymap.set("n", "<leader>h", function()
	ui.nav_file(1)
end, { desc = "Harpoon go to mark 1" })
vim.keymap.set("n", "<leader>j", function()
	ui.nav_file(2)
end, { desc = "Harpoon go to mark 2" })
vim.keymap.set("n", "<leader>k", function()
	ui.nav_file(3)
end, { desc = "Harpoon go to mark 3" })
vim.keymap.set("n", "<leader>l", function()
	ui.nav_file(4)
end, { desc = "Harpoon go to mark 4" })
vim.keymap.set("n", "<leader>ç", function()
	ui.nav_file(5)
end, { desc = "Harpoon go to mark 5" })

-- Split/Join line of code
vim.keymap.set("n", "<Leader>tr", require("treesj").toggle, { desc = "Split/Join line of code" })

-- Make a script executable
vim.keymap.set("n", "<Leader>X", ":w<bar>!chmod +x %<CR>", { desc = "Make script executable", silent = true })

-- Move argument/parameter left/right
vim.keymap.set("n", "<A-L>", vim.cmd.SidewaysRight, { desc = "Move argument/parameter right" })
vim.keymap.set("n", "<A-H>", vim.cmd.SidewaysLeft, { desc = "Move argument/parameter left" })

-- View markdown file with glow plugin
vim.keymap.set("n", "<Leader>G", vim.cmd.Glow, { desc = "View markdown file with glow" })

-- Copilot chat plugin
vim.keymap.set("v", "<Leader>an", ":CopilotChat explain<CR>", { desc = "Analyze (CopilotChat)" })
vim.keymap.set("v", "<Leader>af", ":CopilotChat fix<CR>", { desc = "Fix (CopilotChat)" })
vim.keymap.set("v", "<Leader>ac", ":CopilotChat commit<CR>", { desc = "Write commit message (CopilotChat)" })

-- Avante plugin
-- vim.keymap.set("n", "<Leader>ak", ":AvanteAsk<CR>", { desc = "avante: ask" })

-------------------------
---- DELETE KEYMAPS -----

-- vim.keymap.del("n", "<Leader>l")

-------------------------
---- BACKUP KEYMAPS -----

-- vim.keymap.set("v", "S", "<nop>", { noremap = true })

-- Change to current buffer's parent directory and run command
-- vim.keymap.set("n", "<Leader>cd", ":!cd %:p:h && ", { desc = "Change to current buffer's parent directory" })

-- vim.keymap.set("n", "<leader>gi", ":G | on<CR>", { desc = "Git Status" })
