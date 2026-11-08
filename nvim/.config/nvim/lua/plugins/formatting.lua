return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	keys = {
		{
			"<Leader>cf",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			mode = { "n", "x" },
			desc = "Format",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			python = { "ruff_format" },
		},
	},
}
