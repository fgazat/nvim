local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "dstein64/vim-startuptime",
    "lewis6991/impatient.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    "moll/vim-bbye",

    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                colors = {
                    theme = {
                        wave = {
                            ui = {
                                float = {
                                    bg = "none",
                                },
                                bg_visual = "#756d57",
                            },
                        },
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                },
            })
        end
    },
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons,
        },
    },
    -- Fold,
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async"
    },
    --,
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
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
    "lukas-reineke/indent-blankline.nvim",
    -- "jiangmiao/auto-pairs",
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
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },
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
    "JoosepAlviste/nvim-ts-context-commentstring",

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        dependencies = { { "nvim-tree/nvim-web-devicons" } }
    }
}


require("lazy").setup(plugins)
