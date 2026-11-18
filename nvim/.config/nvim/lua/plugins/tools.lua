return {
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
		ft = { "markdown", "opencode_output" },
		-- only triggers the load; config replaces it with the Snacks toggle
		keys = {
			{ "<leader>um", desc = "Toggle Markdown Render" },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
			Snacks.toggle
				.new({
					name = "Markdown Render",
					get = function()
						return require("render-markdown").get(vim.api.nvim_get_current_buf())
					end,
					set = function(state)
						require("render-markdown").set_buf(state)
					end,
				})
				:map("<leader>um")
		end,
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "opencode_output" },
			overrides = {
				filetype = {
					markdown = { enabled = false },
					opencode_output = { anti_conceal = { enabled = false } },
				},
			},
		},
	},
	{
		"sudo-tee/opencode.nvim",
		-- opencode creates the real mappings when it loads; these only trigger the load
		cmd = "Opencode",
		keys = {
			{ "<leader>ag", desc = "Toggle Opencode window" },
			{ "<leader>a/", mode = { "n", "x" }, desc = "Quick chat with current context" },
			{ "<leader>ay", mode = "x", desc = "Add visual selection to context" },
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"saghen/blink.cmp",
			"MeanderingProgrammer/render-markdown.nvim",
		},
		opts = {
			preferred_picker = "telescope",
			keymap_prefix = "<leader>a",
			keymap = {
				-- use the default <leader>o names here, keymap_prefix rewrites them to <leader>a
				editor = {
					["<leader>oc"] = { "open_input_new_session", desc = "Open input (new session)" },
					["<leader>oI"] = false,
				},
				input_window = {
					["<C-s>"] = { "submit_input_prompt", mode = { "n", "i" }, desc = "Submit prompt" },
					-- cycle through every window like <C-w>w instead of only input/output
					["<tab>"] = {
						function()
							vim.cmd("wincmd w")
						end,
						mode = { "n" },
						desc = "Next window",
						defer_to_completion = true,
					},
				},
				output_window = {
					["<tab>"] = {
						function()
							vim.cmd("wincmd w")
						end,
						mode = { "n" },
						desc = "Next window",
					},
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
