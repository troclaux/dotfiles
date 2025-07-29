return {
	"tpope/vim-sleuth",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-fugitive",
	"mbbill/undotree",
	"preservim/tagbar",
	"tommcdo/vim-exchange",
	"ThePrimeagen/harpoon",
	"AndrewRadev/sideways.vim",
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
