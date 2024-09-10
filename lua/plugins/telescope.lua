return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
		{ "<C-h>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		-- { "<Leader>sp", require("telescope.builtin").git_commits, desc = "Find Vim Options" },
	},
}
