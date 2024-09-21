return {
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"andrewradev/sideways.vim",
	"ThePrimeagen/harpoon",
	"tommcdo/vim-exchange",
	"chrisbra/csv.vim",
	"preservim/tagbar",
	"mbbill/undotree",
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
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
