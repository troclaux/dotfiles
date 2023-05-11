local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = 'Harpoon mark' } )
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu, { desc = 'Harpoon menu' } )
vim.keymap.set("n", "<leader>cc", mark.clear_all, { desc = 'Harpoon clear marks' } )

vim.keymap.set("n", "<leader>h", function() ui.nav_file(1) end, { desc = 'Navigate mark 1' } )
vim.keymap.set("n", "<leader>j", function() ui.nav_file(2) end, { desc = 'Navigate mark 2' } )
vim.keymap.set("n", "<leader>k", function() ui.nav_file(3) end, { desc = 'Navigate mark 3' } )
vim.keymap.set("n", "<leader>l", function() ui.nav_file(4) end, { desc = 'Navigate mark 4' } )

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = 'Navigate mark 1' } )
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = 'Navigate mark 2' } )
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = 'Navigate mark 3' } )
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = 'Navigate mark 4' } )
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = 'Navigate mark 5' } )
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end, { desc = 'Navigate mark 6' } )

vim.keymap.set("n", "<leader>.", function() ui.nav_next() end, { desc = 'Next Harpoon mark' } )
vim.keymap.set("n", "<leader>,", function() ui.nav_prev() end, { desc = 'Previous Harpoon mark' } )
