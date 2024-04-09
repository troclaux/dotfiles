return {
	"tpope/vim-fugitive",
	"ThePrimeagen/harpoon",
	"tpope/vim-surround",
	"tpope/vim-sleuth",
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
