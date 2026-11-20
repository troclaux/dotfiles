return {
	"tpope/vim-sleuth",
	"tpope/vim-repeat",
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
	"tommcdo/vim-exchange",
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		keys = function()
			local function move(key, fn, capture, desc)
				return {
					key,
					function()
						require("nvim-treesitter-textobjects.move")[fn](capture, "textobjects")
					end,
					mode = { "n", "x", "o" },
					desc = desc,
				}
			end
			local function swap(key, fn, desc)
				return {
					key,
					function()
						require("nvim-treesitter-textobjects.swap")[fn]("@parameter.inner")
					end,
					desc = desc,
				}
			end
			return {
				move("]f", "goto_next_start", "@function.outer", "Next function start"),
				move("[f", "goto_previous_start", "@function.outer", "Previous function start"),
				move("]F", "goto_next_end", "@function.outer", "Next function end"),
				move("[F", "goto_previous_end", "@function.outer", "Previous function end"),
				move("]c", "goto_next_start", "@class.outer", "Next class start"),
				move("[c", "goto_previous_start", "@class.outer", "Previous class start"),
				move("]C", "goto_next_end", "@class.outer", "Next class end"),
				move("[C", "goto_previous_end", "@class.outer", "Previous class end"),
				swap("<A-L>", "swap_next", "Swap parameter with next"),
				swap("<A-H>", "swap_previous", "Swap parameter with previous"),
			}
		end,
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
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{ "<Leader>rp", "<cmd>GrugFar<CR>", desc = "Search and replace in project" },
			{
				"<Leader>rp",
				function()
					require("grug-far").with_visual_selection()
				end,
				mode = "x",
				desc = "Search and replace selection in project",
			},
		},
		opts = {},
	},
}
