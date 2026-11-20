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
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ug")
					Snacks.toggle.zen():map("<leader>uz")
					Snacks.toggle.zoom():map("<leader>uZ")
					Snacks.toggle.dim():map("<leader>uD")
					Snacks.toggle.treesitter():map("<leader>uT")
				end,
			})
		end,
		opts = {
			picker = { enabled = true },
			indent = { enabled = true, animate = { enabled = false } },
			scope = { enabled = true },
			bigfile = { enabled = true },
			notifier = { enabled = true },
			image = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
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
