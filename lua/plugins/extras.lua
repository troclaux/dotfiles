return {
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
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
		"chrisgrieser/nvim-various-textobjs",
		event = "UIEnter",
		opts = { useDefaultKeymaps = true },
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
