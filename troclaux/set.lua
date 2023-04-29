vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- vim.opt.smartindent = true
vim.o.autoindent = true
vim.cmd('filetype plugin on')

vim.o.hlsearch = true
vim.opt.incsearch = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
