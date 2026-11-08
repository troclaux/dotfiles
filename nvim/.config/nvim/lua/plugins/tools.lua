return {
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"sudo-tee/opencode.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"saghen/blink.cmp",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
					file_types = { "opencode_output" },
				},
				ft = { "opencode_output" },
			},
		},
		opts = {
			preferred_picker = "telescope",
			keymap_prefix = "<leader>a",
			keymap = {
				input_window = {
					["<C-s>"] = { "submit_input_prompt", mode = { "n", "i" }, desc = "Submit prompt" },
				},
			},
		},
	},
	{
		"hat0uma/csvview.nvim",
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
		---@module "csvview"
		---@type CsvView.Options
		opts = {
			parser = { comments = { "#", "//" } },
			keymaps = {
				-- Text objects for selecting fields
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
				-- Excel-like navigation:
				-- Use <Tab> and <S-Tab> to move horizontally between fields.
				-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
				-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
				jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
				jump_next_row = { "<Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
			},
		},
	},
}
