return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		-- suggestion = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<C-b>",
				accept_word = "<C-v>",
				accept_line = false,
				next = "<C-j>",
				prev = "<C-l>",
				dismiss = "<C-]>",
			},
		},
		panel = {
			enabled = true,
			auto_refresh = false,
			keymap = {
				jump_prev = "<",
				jump_next = ">",
				-- jump_prev = "[[",
				-- jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<C-q>",
			},
			layout = {
				position = "right", -- bottom | top | left | right
				ratio = 0.4,
			},
		},
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
