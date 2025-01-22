return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {
		mappings = {
			-- ask = "<leader>ai",
			-- edit = "<leader>ae",
			-- refresh = "<leader>ar",
			--- @class AvanteConflictMappings
			diff = {
				ours = "<Leader>ao",
				theirs = "<Leader>at",
				all_theirs = "<Leader>aT",
				both = "<Leader>ab",
				cursor = "<Leader>ac",
			},
		},
		hints = { enabled = false },
		windows = {
			wrap = true, -- similar to vim.o.wrap
			width = 50, -- default % based on available width
			sidebar_header = {
				align = "center", -- left, center, right for title
				rounded = true,
			},
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.icons", -- or nvim-tree/nvim-web-devicons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		-- {
		-- 	-- Make sure to setup it properly if you have lazy=true
		-- 	"MeanderingProgrammer/render-markdown.nvim",
		-- 	opts = {
		-- 		file_types = { "markdown", "Avante" },
		-- 	},
		-- 	ft = { "markdown", "Avante" },
		-- },
	},
}
