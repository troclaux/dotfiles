vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

    'tpope/vim-fugitive',
    'tpope/vim-unimpaired',
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-sleuth',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    -- 'godlygeek/tabular',
    'tommcdo/vim-lion',
    -- 'zbirenbaum/copilot.lua',
    'wellle/context.vim',
    'preservim/tagbar',
    'mg979/vim-visual-multi',
    'saadparwaiz1/cmp_luasnip',

    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end
    -- },

    { "catppuccin/nvim", name = "catppuccin" },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = { }
    },


    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                path = 2,
                theme = 'material',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- {
    --     -- Add indentation guides even on blank lines
    --     'lukas-reineke/indent-blankline.nvim', main = "ibl",
    --     -- Enable `lukas-reineke/indent-blankline.nvim`
    --     -- See `:help indent_blankline.txt`
    --     opts = {
    --         -- char = '┊',
    --         show_trailing_blankline_indent = true,
    --     },
    -- },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
            },

            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required

        }
    },

    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    {
        'Wansmer/treesj',
        -- keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    },

}, {})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {})
vim.api.nvim_create_autocmd('TextYankPost', {
    group = highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 90,
        })
    end,
})

require('telescope').setup()

require('nvim-treesitter.configs').setup({

    -- A list of parser names, or "all"
    ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "go", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {

        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages

        additional_vim_regex_highlighting = false,
    },
})

-- Setup lsp-zero
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

-- require("copilot").setup({
--     suggestion = { enabled = false },
--     panel = { enabled = false },
-- })
-- require("copilot_cmp").setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({

    preselect = 'item',

    completion = {
        completeopt = 'menu,menuone,noinsert'
    },

    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },

    sources = {
        -- {name = 'copilot'},
        -- {name = 'buffer'},
        {name = 'luasnip'},
        {name = 'nvim_lsp'},
        {name = 'lsp-zero'},
        {name = 'nvim_lsp_signature_help'},
    },

    mapping = {
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})

require("remap")
require("set")
