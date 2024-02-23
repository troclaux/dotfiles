return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		opts.sections = {
			lualine_c = { { "filename", path = 2 } },
		}
	end,
}
