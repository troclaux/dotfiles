return {
	"tpope/vim-fugitive",
	"ThePrimeagen/harpoon",
	"tommcdo/vim-exchange",
	"andrewradev/sideways.vim",
	"chrisbra/csv.vim",
	"mbbill/undotree",
	"tpope/vim-surround",
	"tpope/vim-sleuth",
	"preservim/tagbar",
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			-- add options here
			-- or leave it empty to use the default settings
		},
		keys = {
			-- suggested keymap
			-- { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
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
