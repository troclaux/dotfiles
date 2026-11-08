return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_c = { { "filename", path = 2 } },
			},
		},
	},
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = { indent = { enabled = true, animate = { enabled = false } } },
	},
}
