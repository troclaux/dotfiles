-------------------------
-- INSERT MODE KEYMAPS --

-- Automatically closes curly braces
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-------------------------
-- VISUAL MODE KEYMAPS --

-- Select until start of line in visual mode
vim.keymap.set("x", "H", "^", { desc = "Go to start of line" })

-- Select until end of line in visual mode
vim.keymap.set("x", "L", "g_", { desc = "Go to end of line" })

-- Keep buffer after pasting over selection
vim.keymap.set("x", "p", "P")

-- Replace occurrences
vim.keymap.set("x", "<Leader>rr", ":s/", { desc = "Replace occurrences" })
vim.keymap.set("n", "<Leader>rm", "mz:keeppatterns %s/\\r//ge<CR>`z", { desc = "Remove ^M" })

-- run normal command on visual selection
vim.keymap.set("x", "<Leader>n", ":norm ", { desc = "Run normal mode command" })
vim.keymap.set("x", "<Leader>m", ":norm @w<CR>", { desc = "Run macro" })

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

-- Switch window
vim.keymap.set("n", "<Tab>", "<C-w>w", { desc = "Switch window" })
-- without its own mapping, <C-i> falls back to the <Tab> one above and stops jumping forward
vim.keymap.set("n", "<C-i>", "<C-i>", { desc = "Jump forward" })

-- Close all other windows
vim.keymap.set("n", "ç", "<C-w>o", { desc = "Close all other windows" })

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Reselect pasted text" })

-- Center viewport on highlighted search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Go to previous buffer
vim.keymap.set("n", "<C-b>", "<C-^>", { desc = "Go to previous buffer" })

-- Keep viewport centralized when using ctrl+d and ctrl+u
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Copy path of current buffer to clipboard
vim.keymap.set("n", "yp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("📋 Copied path: " .. path)
end, { desc = "Copy file path to clipboard" })

-- Change word and go to next instance
vim.keymap.set("n", "<Leader>rn", "*``cgn", { desc = "Replace word and go to next instance" })

-- Replace occurrences
vim.keymap.set("n", "<Leader>rr", ":%s/", { desc = "Replace occurrences" })

-- Remove Trailing Whitespace
vim.keymap.set("n", "<Leader>rw", [[mz:keeppatterns %s/\s\+$//e<CR>`z]], { desc = "Remove Trailing Whitespace" })

-- Quit nvim
vim.keymap.set("n", "<Leader>o", ":q<CR>", { desc = "Quit nvim" })

-- Save current buffer
vim.keymap.set("n", "<Leader>i", ":w<CR>", { desc = "Save current buffer" })

-- Go to left window and close all other windows
vim.keymap.set("n", "\\", "<C-w>h<C-w>h<C-w>o", { desc = "Go to left window and close all other windows" })

-- Apply title case
vim.keymap.set("n", "<Leader>tc", [[mz:keeppatterns s/\<./\u&/ge<CR>`z]], { desc = "Convert to Title Case" })

-- Keybind for tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux sessionizer" })

-- Open new tmux window in the parent folder of current buffer
vim.keymap.set("n", "<Leader>tw", function()
	local parent_dir = vim.fn.expand("%:p:h")
	vim.fn.system({ "tmux", "neww", "-c", parent_dir })
end, { desc = "Open tmux window in parent directory" })


----------------------
-- SNIPPETS KEYMAPS --
----------------------

-- Markdown
vim.keymap.set("n", "<Leader>pf", "o- [ ] ", { desc = "Insert markdown form" })
vim.keymap.set(
	"n",
	"<Leader>pc",
	"o<Esc>p`[v`]omzo<Esc>o<Esc>S```<Esc>`zO```",
	{ desc = "Paste and surround with ```" }
)
vim.keymap.set("x", "<Leader>pc", "omzo<Esc>o```<Esc>`zO```", { desc = "Surround with ```" })
vim.keymap.set("n", "<leader>pi", function()
	local text = vim.fn.getreg("+")
	text = text:gsub("^%s+", ""):gsub("%s+$", "")
	local surrounded = "`" .. text .. "`"
	vim.api.nvim_put(vim.split(surrounded, "\n"), "c", true, true)
end, { desc = "Paste text and surround with backticks" })

vim.keymap.set("n", "<Leader>1", 'o<Esc>0"_Di# ', { desc = "Insert markdown heading #" })
vim.keymap.set("n", "<Leader>2", 'o<Esc>0"_Di## ', { desc = "Insert markdown heading ##" })
vim.keymap.set("n", "<Leader>3", 'o<Esc>0"_Di### ', { desc = "Insert markdown heading ###" })
vim.keymap.set("n", "<Leader>4", 'o<Esc>0"_Di#### ', { desc = "Insert markdown heading ####" })

-- Remove bold notation in markdown (**)
vim.keymap.set("x", "<Leader>rb", ":<C-u>keeppatterns '<,'>s/\\*//ge<CR>", { desc = "Remove asterisks in selection" })
vim.keymap.set("n", "<Leader>rb", ":keeppatterns s/\\*//ge<CR>", { desc = "Remove asterisks in current line" })

-- Insert anchor link
vim.keymap.set("n", "<Leader>pa", "ciW[](#)<Esc>F[pf#a", { desc = "Insert anchor link" })
vim.keymap.set("x", "<Leader>pa", "c[](#)<Esc>F[pf#a", { desc = "Insert anchor link" })

-----------------------
-- LAZY.NVIM KEYMAPS --
-----------------------

-- Other plugin keymaps live next to their plugin in lua/plugins/

-- Access lazy.vim menu
vim.keymap.set("n", "<Leader>L", vim.cmd.Lazy, { desc = "Lazy.nvim menu" })

-- Update nvim plugins
vim.keymap.set("n", "<Leader>U", ":Lazy update<CR>", { desc = "Update nvim plugins" })

-------------------------
---- DELETE KEYMAPS -----

-- vim.keymap.del("n", "<Leader>l")

-------------------------
---- BACKUP KEYMAPS -----

-- vim.keymap.set("x", "S", "<nop>", { noremap = true })

-- Change to current buffer's parent directory and run command
-- vim.keymap.set("n", "<Leader>cd", ":!cd %:p:h && ", { desc = "Change to current buffer's parent directory" })

-- vim.keymap.set("n", "<leader>gi", ":G | on<CR>", { desc = "Git Status" })
