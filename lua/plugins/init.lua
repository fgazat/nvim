return {
    { "moll/vim-bbye", },
    "rcarriga/nvim-notify",

    {
        "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
        dir = "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
        config = function()
            require('telescope').load_extension('arc')
        end
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async"
    },
    -- DEBUG,
    { "mfussenegger/nvim-dap", lazy = true },
    { "rcarriga/nvim-dap-ui",  lazy = true },
    { "leoluz/nvim-dap-go",    lazy = true },
    -- Surround,
    { "tpope/vim-surround", },
    -- TreeSitter.,
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
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

    -- "williamboman/nvim-lsp-installer",
    -- cmp plugins,
    { "hrsh7th/nvim-cmp", },
    { "hrsh7th/cmp-buffer", },  -- buffer completions,
    { "hrsh7th/cmp-path", },    -- path completions,
    { "hrsh7th/cmp-cmdline", }, -- cmdline completions,
    { "hrsh7th/cmp-nvim-lsp", },
    { "hrsh7th/cmp-emoji", },
    { "hrsh7th/cmp-nvim-lua", },
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
    { "ray-x/lsp_signature.nvim", },
    {
        "numToStr/Comment.nvim",
        config = true,
        --    lazy = true

    },
}
