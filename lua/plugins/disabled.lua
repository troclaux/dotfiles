return {
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{ "nvim-mini/mini.pairs", enabled = false },
	{ "folke/persistence.nvim", enabled = false },
	{ "folke/flash.nvim", enabled = false },
	{ "folke/noice.nvim", enabled = false },
	{ url = "https://codeberg.org/andyg/leap.nvim.git", enabled = false },
	{ url = "https://codeberg.org/andyg/flit.nvim.git", enabled = false },
	{ "akinsho/bufferline.nvim", enabled = false },
	-- Disable lazygit keymaps from snacks.nvim (using vim-fugitive instead)
	{
		"folke/snacks.nvim",
		keys = {
			{ "<leader>gg", false },
			{ "<leader>gG", false },
			{ "<leader>gf", false },
			{ "<leader>gl", false },
			{ "<leader>gL", false },
		},
	},
}
