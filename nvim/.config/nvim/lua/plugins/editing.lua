return {
	"tpope/vim-sleuth",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tommcdo/vim-exchange",
	{
		"AndrewRadev/sideways.vim",
		keys = {
			{ "<A-L>", "<cmd>SidewaysRight<CR>", desc = "Move argument/parameter right" },
			{ "<A-H>", "<cmd>SidewaysLeft<CR>", desc = "Move argument/parameter left" },
		},
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			{
				"<Leader>tr",
				function()
					require("treesj").toggle()
				end,
				desc = "Split/Join line of code",
			},
		},
		opts = { use_default_keymaps = false },
	},
	{
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" } },
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
				},
			}
		end,
	},
	{ "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
	{ "folke/ts-comments.nvim", event = "VeryLazy", opts = {} },
}
