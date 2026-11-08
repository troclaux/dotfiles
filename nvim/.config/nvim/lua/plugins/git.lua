return {
	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{ "<Leader>gi", "<cmd>vert Git<CR>", desc = "Git Status" },
			{ "<Leader>gp", "<cmd>Git push<CR>", desc = "Git Push" },
			{ "<Leader>gl", ":GcLog -S ", silent = false, desc = "Search commits that changed a string" },
			{ "gh", "<cmd>diffget //2<CR>", desc = "Take left side of merge" },
			{ "gl", "<cmd>diffget //3<CR>", desc = "Take right side of merge" },
		},
	},
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
}
