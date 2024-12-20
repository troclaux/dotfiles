return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			opts = {
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept_word = "<C-j>",
						accept_line = "<C-l>",
						accept = false,
						next = "<C-v>",
						prev = "<C-b>",
						dismiss = "<C-]>",
					},
				},
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[g",
						jump_next = "]g",
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
					["*"] = true,
				},
			},
		})
	end,
}
