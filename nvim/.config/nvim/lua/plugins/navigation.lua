local function harpoon_nav(index)
	return function()
		require("harpoon.ui").nav_file(index)
	end
end

return {
	{
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
			{ "<C-j>", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<C-k>", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find Document Symbols" },
		},
	},
	{
		"stevearc/oil.nvim",
		-- loaded at startup so it can open directories in place of netrw
		lazy = false,
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open file explorer" },
			{ "<Leader>e", "<cmd>Oil<CR>", desc = "Open file explorer" },
		},
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			delete_to_trash = true,
			keymaps = {
				["<C-p>"] = false,
				["<C-h>"] = false,
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<Leader>m",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Harpoon mark",
			},
			{
				"<Leader>n",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Harpoon menu",
			},
			{
				"<Leader>C",
				function()
					require("harpoon.mark").clear_all()
				end,
				desc = "Harpoon clear marks",
			},
			{ "<Leader>h", harpoon_nav(1), desc = "Harpoon go to mark 1" },
			{ "<Leader>j", harpoon_nav(2), desc = "Harpoon go to mark 2" },
			{ "<Leader>k", harpoon_nav(3), desc = "Harpoon go to mark 3" },
			{ "<Leader>l", harpoon_nav(4), desc = "Harpoon go to mark 4" },
			{ "<Leader>ç", harpoon_nav(5), desc = "Harpoon go to mark 5" },
		},
	},
	{
		"preservim/tagbar",
		cmd = "TagbarToggle",
		keys = {
			{ "<Leader><Leader>", "<cmd>TagbarToggle fjc<CR>", desc = "Show current buffer summary" },
		},
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<F5>", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree panel" },
		},
	},
	{ "folke/trouble.nvim", cmd = "Trouble", opts = {} },
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTelescope", "TodoTrouble", "TodoQuickFix" },
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
