return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile", "BufWritePost" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			python = { "pylint" },
			terraform = { "tflint" },
			markdown = { "markdownlint-cli2" },
		}
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
			callback = function()
				-- ignore_errors: a linter that isn't installed shouldn't raise an error on every save
				lint.try_lint(nil, { ignore_errors = true })
			end,
		})
	end,
}
