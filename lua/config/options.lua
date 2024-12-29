vim.g.snacks_animate = false
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
