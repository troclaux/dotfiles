vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }

vim.opt.scrolloff = 8

vim.o.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "no"
-- vim.opt.colorcolumn = "80"

vim.o.whichwrap = "lh"

vim.o.mouse = 'a'

vim.cmd.colorscheme "catppuccin"
