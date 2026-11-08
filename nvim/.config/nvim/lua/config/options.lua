vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"
vim.lsp.log.set_level("off")
vim.o.verbose = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.laststatus = 3
vim.opt.whichwrap = "lh"
vim.opt.conceallevel = 0
vim.opt.scrolloff = 8
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.list = true
vim.opt.listchars:append({
	-- eol = '↲',
	-- tab = "»»",
	nbsp = "␣",
	trail = "•",
	extends = ">",
	precedes = "<",
})
