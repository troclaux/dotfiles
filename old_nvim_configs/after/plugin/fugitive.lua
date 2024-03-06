vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = 'Git Stash' } )
vim.keymap.set('n', '<Leader>gp', ':Git push<CR>', { noremap = true, desc = 'Git Push' })
vim.keymap.set('n', '<Leader>gu', ':Git pull<CR>', { noremap = true, desc = 'Git Pull' })
vim.keymap.set('n', '<Leader>gl', ':GcLog -S ', { noremap = true, desc = 'Search git commit messages' })

vim.keymap.set("n", "gh", "<C>diffget //2<CR>")
vim.keymap.set("n", "gl", "<C>diffget //3<CR>")
