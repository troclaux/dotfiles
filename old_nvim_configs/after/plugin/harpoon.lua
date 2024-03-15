local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = "Harpoon mark" })
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>cc", mark.clear_all, { desc = "Harpoon clear marks" })

vim.keymap.set("n", "<leader>h", ui.nav_file(1), { desc = "Navigate mark 1" })
vim.keymap.set("n", "<leader>j", ui.nav_file(2), { desc = "Navigate mark 2" })
vim.keymap.set("n", "<leader>k", ui.nav_file(3), { desc = "Navigate mark 3" })
vim.keymap.set("n", "<leader>l", ui.nav_file(4), { desc = "Navigate mark 4" })

-- vim.keymap.set("n", "<leader>.", ui.nav_next(), { desc = "Next Harpoon mark" })
-- vim.keymap.set("n", "<leader>,", ui.nav_prev(), { desc = "Previous Harpoon mark" })
