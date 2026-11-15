return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local install = require("nvim-treesitter").install({
			"bash",
			"c",
			"diff",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		})
		-- without a UI (scripts/reinstall_nvim.sh), Neovim could quit mid-install
		if #vim.api.nvim_list_uis() == 0 then
			install:wait(300000)
		end
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- start() errors when the filetype has no installed parser
				if pcall(vim.treesitter.start, args.buf) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
