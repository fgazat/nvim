return {
    "moll/vim-bbye",
    "rcarriga/nvim-notify",


    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules"
                    }
                }
            }
        end
    },
    -- DEBUG,
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    -- Surround,
    "tpope/vim-surround",
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
    "preservim/tagbar",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",

    -- "williamboman/nvim-lsp-installer",
    -- cmp plugins,
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",  -- buffer completions,
    "hrsh7th/cmp-path",    -- path completions,
    "hrsh7th/cmp-cmdline", -- cmdline completions,
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",
    "jose-elias-alvarez/null-ls.nvim",
    "mbbill/undotree",
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true
    },
    -- snippets,
    "L3MON4D3/LuaSnip",             --snippet engine,
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use,
    "saadparwaiz1/cmp_luasnip",     -- snippet completions,
    "ray-x/lsp_signature.nvim",
    {
        "numToStr/Comment.nvim",
        config = true
    },
    -- "JoosepAlviste/nvim-ts-context-commentstring",
}
