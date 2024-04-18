return {
    { "moll/vim-bbye", },
    "rcarriga/nvim-notify",

    -- {
    --     "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
    --     dir = "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
    --     config = function()
    --         require('telescope').load_extension('arc')
    --     end
    -- },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async"
    },
    -- DEBUG,
    -- { "mfussenegger/nvim-dap", lazy = true },
    -- { "rcarriga/nvim-dap-ui",  lazy = true },
    -- { "leoluz/nvim-dap-go",    lazy = true },
    -- Surround,
    { "tpope/vim-surround", },
    -- TreeSitter.,
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require 'nvim-treesitter.configs'
            configs.setup {
                ensure_installed = 'all',
                -- установка phpdoc падает на m1
                ignore_install = { 'phpdoc', 'smali' },
                highlight = { -- enable highlighting
                    enable = true,
                },
                indent = {
                    enable = false, -- default is disabled anyways
                },
            }
        end
    },
    -- Helping indent lines.,
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup {
                -- indent = { highlight = highlight, char = "" },
                -- whitespace = {
                --     highlight = highlight,
                --     remove_blankline_trail = false,
                -- },
                scope = { enabled = false },
            }
        end
    },

    { "preservim/tagbar",                lazy = true },
    { "neovim/nvim-lspconfig",           lazy = true },
    { "williamboman/mason.nvim",         lazy = true },
    { "jose-elias-alvarez/null-ls.nvim", lazy = true },
    { "mbbill/undotree", },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
        lazy = true

    },
    -- snippets,
    { "L3MON4D3/LuaSnip", },             --snippet engine,
    { "rafamadriz/friendly-snippets", }, -- a bunch of snippets to use,
    { "saadparwaiz1/cmp_luasnip", },     -- snippet completions,
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        "numToStr/Comment.nvim",
        config = true,
        --    lazy = true

    },
}
