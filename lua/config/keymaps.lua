-- Delete lazyvim keymaps --

-- vim.keymap.del("n", "<Leader>l")

-- Insert mode remaps --

-- Automatically closes curly braces
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- Visual mode remaps --

-- Select until start of line in visual mode
vim.keymap.set("v", "H", "^", { desc = "Go to start of line" })

-- Keep buffer after pasting over selection
vim.keymap.set("v", "p", "p`[v`]y")

-- Select until end of line in visual mode
vim.keymap.set("v", "L", "g_", { desc = "Go to end of line" })

-- Align text in visual mode around equals sign
vim.keymap.set("v", "<Leader>=", ":!column -t<CR>gv=", { desc = "Column Align" })

-- Search and replace
vim.keymap.set("v", "<Leader>se", ":s/", { desc = "Search and replace command" })

-- run normal command on visual selection
vim.keymap.set("v", "<Leader>n", ":normal ", { desc = "Run normal mode command" })

-- Normal mode remaps --

-- Go to start of line
vim.keymap.set("n", "H", "^", { desc = "Go to start of line" })

-- Go to end of line
vim.keymap.set("n", "L", "$", { desc = "Go to end of line" })

-- Join current line with line below and keep cursor on same position
vim.keymap.set("n", "J", "mzJ`z")

-- Easy vim search
vim.keymap.set("n", "ç", "/")

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Reselect pasted text" })

-- Select line without newline
vim.keymap.set("n", "vil", "^vg_", { desc = "Select line without newline" })

-- Delete line without newline
vim.keymap.set("n", "dil", "^vg_d", { desc = "Delete line without newline" })

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

-- Change word and go to next instance
vim.keymap.set("n", "<Leader>r", "*``cgn", { desc = "Replace word and go to next instance" })

-- Search and replace

-- Apply title case
vim.keymap.set("n", "<Leader>tc", [[mz:s/\<./\u&/g<CR>:nohlsearch<CR>`z]], { desc = "Convert to title case" })
vim.keymap.set("n", "<Leader>r", ":%s/", { desc = "Search and replace command" })

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

-- Open new tmux window in the parent folder of current buffer
vim.keymap.set("n", "<Leader>tm", function()
	local parent_dir = vim.fn.expand("%:p:h")
	local cmd = "tmux neww -c " .. parent_dir
	vim.fn.system(cmd)
end, { desc = "Open tmux window in parent directory" })

-- My snippets --

-- Markdown heading
vim.keymap.set("n", "<Leader>pf", "o- [ ] ", { desc = "Insert markdown form" })
vim.keymap.set("n", "<Leader>pc", "o```<Esc>kO```<Esc>", { desc = "Surround with ```" })
vim.keymap.set("v", "<Leader>pc", "omzo<Esc>o```<Esc>`zO```<Esc>A", { desc = "Surround with ```" })

vim.keymap.set("n", "<Leader>1", 'o<Esc>0"_Di# ', { desc = "Insert markdown heading #" })
vim.keymap.set("n", "<Leader>2", 'o<Esc>0"_Di## ', { desc = "Insert markdown heading ##" })
vim.keymap.set("n", "<Leader>3", 'o<Esc>0"_Di### ', { desc = "Insert markdown heading ###" })

-- golang error handling
vim.keymap.set("n", "<leader>pe", "oif err != nil {<cr>}<esc>ko", { desc = "insert golang error statement" })

-- Plugin keymaps --

-- Access lazy.vim menu
vim.keymap.set("n", "<Leader>L", vim.cmd.Lazy, { desc = "Lazy.nvim menu" })

-- View lazy.vim extra plugins
vim.keymap.set("n", "<Leader>E", vim.cmd.LazyExtras, { desc = "Lazy.nvim extra plugins" })

-- Access Mason menu
vim.keymap.set("n", "<Leader>M", vim.cmd.Mason, { desc = "Access Mason menu" })

-- Show nvim's startup time
vim.keymap.set("n", "<Leader>S", vim.cmd.StartupTime, { desc = "Show nvim's startup time" })

-- Update nvim plugins
vim.keymap.set("n", "<Leader>U", ":Lazy update<CR>", { desc = "Update nvim plugins" })

-- Undotree plugin
vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree panel" })

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
vim.keymap.set("n", "<Leader>tr", require("treesj").toggle, { desc = "Split/Join line of code" })

-- Make a script executable
vim.keymap.set("n", "<Leader>X", ":w<bar>!chmod +x %<CR>", { desc = "Make script executable", silent = true })

-- Show current buffer summary
vim.keymap.set("n", "<F8>", vim.cmd.TagbarToggle, { desc = "Show current buffer summary" })

-- Move argument/parameter left/right
vim.keymap.set("n", "cl", vim.cmd.SidewaysRight, { desc = "Move argument/parameter right" })
vim.keymap.set("n", "ch", vim.cmd.SidewaysLeft, { desc = "Move argument/parameter left" })

-- Copilot chat plugin
vim.keymap.set("v", "<Leader>ae", ":CopilotChat explain<CR>", { desc = "Explain (CopilotChat)" })
vim.keymap.set("v", "<Leader>af", ":CopilotChat fix<CR>", { desc = "Fix (CopilotChat)" })
vim.keymap.set("v", "<Leader>ac", ":CopilotChat commit<CR>", { desc = "Write commit message (CopilotChat)" })

-- View markdown file with glow plugin
vim.keymap.set("n", "<Leader>G", vim.cmd.Glow, { desc = "View markdown file with glow" })

-- Change to current buffer's parent directory and run command
-- vim.keymap.set("n", "<Leader>cd", ":!cd %:p:h && ", { desc = "Change to current buffer's parent directory" })

-- vim.keymap.set("n", "<leader>gi", ":G | on<CR>", { desc = "Git Status" })

-- vim.keymap.set("v", "S", "<nop>", { noremap = true })
