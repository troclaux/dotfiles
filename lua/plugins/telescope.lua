return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
	},
}

-- local builtin = require("telescope.builtin")

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' } )
-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' } )
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find Grep' } )
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' } )
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' } )
-- vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find Old Files' } )
-- vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume Search' })
-- vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find Commands' })
-- vim.keymap.set('n', '<leader>pr', builtin.registers, { desc = 'Find Registers' })
-- vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, { desc = 'Show Definitions' })

-- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git Files" })
