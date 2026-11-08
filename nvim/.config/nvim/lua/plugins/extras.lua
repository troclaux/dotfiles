return {
	"tpope/vim-sleuth",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-fugitive",
	"mbbill/undotree",
	"preservim/tagbar",
	"tommcdo/vim-exchange",
	{ "ThePrimeagen/harpoon", branch = "master", dependencies = { "nvim-lua/plenary.nvim" } },
	"AndrewRadev/sideways.vim",
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTelescope", "TodoTrouble", "TodoQuickFix" },
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "folke/trouble.nvim", cmd = "Trouble", opts = {} },
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = { indent = { enabled = true, animate = { enabled = false } } },
	},
	{
		"Wansmer/treesj",
		lazy = true,
		-- keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
}
