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
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(buf)
				local gs = require("gitsigns")
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
				end
				map("]h", function()
					gs.nav_hunk("next")
				end, "Next hunk")
				map("[h", function()
					gs.nav_hunk("prev")
				end, "Previous hunk")
				map("<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
				map("<leader>gr", gs.reset_hunk, "Reset hunk")
				map("<leader>gb", gs.blame_line, "Blame line")
				map("<leader>gh", gs.preview_hunk, "Preview hunk")
			end,
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<Leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff working tree" },
			{ "<Leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Current file history" },
		},
	},
}
