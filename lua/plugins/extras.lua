return {
	"tpope/vim-fugitive",
	"ThePrimeagen/harpoon",
	"andrewradev/sideways.vim",
	"mbbill/undotree",
	"tpope/vim-surround",
	"tpope/vim-sleuth",
	"preservim/tagbar",
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
