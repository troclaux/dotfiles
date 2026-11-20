local function harpoon_nav(index)
	return function()
		require("harpoon.ui").nav_file(index)
	end
end

return {
	{
		"folke/snacks.nvim",
		keys = {
			{
				"<C-p>",
				function()
					-- git_files lists nothing outside a git repository
					if Snacks.git.get_root() then
						Snacks.picker.git_files()
					else
						Snacks.picker.files()
					end
				end,
				desc = "Find Git Files (all files outside a repo)",
			},
			{ "<C-h>", function() Snacks.picker.files() end, desc = "Find Files" },
			{ "<C-j>", function() Snacks.picker.grep() end, desc = "Live Grep" },
			{ "<C-k>", function() Snacks.picker.lsp_symbols() end, desc = "Find Document Symbols" },
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
		cmd = { "TodoTrouble", "TodoQuickFix" },
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- show mark letters in the sign column
	{ "chentoast/marks.nvim", event = { "BufReadPost", "BufNewFile" }, opts = {} },
}
