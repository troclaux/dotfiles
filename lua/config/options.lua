vim.opt.whichwrap = "lh"
vim.opt.conceallevel = 0
vim.opt.list = true
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.listchars:append({
	-- eol = '↲',
	-- tab = "»»",
	nbsp = "␣",
	trail = "•",
	extends = ">",
	precedes = "<",
})
