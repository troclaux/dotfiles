vim.api.nvim_set_var('copilot_assume_mapped', true)
vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { expr = true, silent = true } )
