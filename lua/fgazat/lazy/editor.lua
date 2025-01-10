return {
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            vim.notify = require("notify")

            require("notify").setup({
                background_colour = "#000000",
                render = "wrapped-compact",
                max_width = 80,
            })
        end
    },

    {
        "tpope/vim-surround",
        event = "VeryLazy"
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            scope = { enabled = false },
        },
    },

    { "mbbill/undotree" },

    {
        "numToStr/Comment.nvim",
        config = true,
        event = "BufEnter",
    },

    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    'jghauser/follow-md-links.nvim',
}
