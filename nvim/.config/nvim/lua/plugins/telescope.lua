return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup()
		require("telescope").load_extension("fzf")
	end,
	keys = {
		{ "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
		{ "<C-h>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<C-j>", "<cmd>Telescope live_grep<CR>", desc = "Find Files" },
		{ "<C-k>", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find Workspace Symbols" },
		-- { "<Leader>sp", require("telescope.builtin").git_commits, desc = "Find Vim Options" },
	},
}
