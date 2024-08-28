return {
	"yetone/avante.nvim",
	lazy = true,
	event = "VeryLazy",
	build = "make",
	opts = {
		mappings = {
			ask = "<leader>aa",
			edit = "<leader>ae",
			refresh = "<leader>ar",
			--- @class AvanteConflictMappings
			diff = {
				ours = "<Leader>ao",
				theirs = "<Leader>at",
				both = "<Leader>ab",
				next = "]x",
				prev = "[x",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			toggle = {
				debug = "<leader>ad",
				hint = "<leader>ah",
			},
		},
		windows = {
			wrap = true, -- similar to vim.o.wrap
			width = 50, -- default % based on available width
			sidebar_header = {
				align = "center", -- left, center, right for title
				rounded = true,
			},
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
