return {
    { "moll/vim-bbye", },

    "rcarriga/nvim-notify",
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async"
    },

    -- DEBUG,
    -- { "mfussenegger/nvim-dap", lazy = true },
    -- { "rcarriga/nvim-dap-ui",  lazy = true },
    -- { "leoluz/nvim-dap-go",    lazy = true },
    -- Surround,

    { "tpope/vim-surround" },
    { "dstein64/vim-startuptime" },

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
                scope = { enabled = false },
            }
        end
    },

    { "preservim/tagbar",        lazy = true },
    { "neovim/nvim-lspconfig",   lazy = true },
    { "williamboman/mason.nvim", lazy = true },
    { "mbbill/undotree" },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
        lazy = true

    },
    -- snippets,
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
