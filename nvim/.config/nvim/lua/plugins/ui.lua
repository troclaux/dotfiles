return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_c = { { "filename", path = 2 } },
			},
		},
	},
	-- helix: a single-column popup in the bottom-right corner
	{ "folke/which-key.nvim", event = "VeryLazy", opts = { preset = "helix" } },
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			indent = { enabled = true, animate = { enabled = false } },
			scope = { enabled = true },
		},
	},
}
