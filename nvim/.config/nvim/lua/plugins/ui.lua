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
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":Telescope find_files cwd=" .. vim.fn.stdpath("config"),
						},
						{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					-- "Neovim loaded N/M plugins in X ms"
					{ section = "startup" },
				},
			},
		},
	},
}
