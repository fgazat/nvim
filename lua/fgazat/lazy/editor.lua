return {
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
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
    {
        "numToStr/Comment.nvim",
        config = true,
        event = "VeryLazy",
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "diagnostics" },
        }
    },

    { "tpope/vim-dadbod",             event = "VeryLazy" },
    { "kristijanhusak/vim-dadbod-ui", event = "VeryLazy" },

}
