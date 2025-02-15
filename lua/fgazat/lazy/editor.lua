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
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            scope = { enabled = false },
        },
    },
    { "mbbill/undotree",              event = "VeryLazy", keys = { { "<leader>u", vim.cmd.UndotreeToggle, desc = "diagnostics" } } },
    { "tpope/vim-surround",           event = "VeryLazy" },
    { "numToStr/Comment.nvim",        event = "VeryLazy", config = true, },
    { "tpope/vim-dadbod",             event = "VeryLazy" },
    { "kristijanhusak/vim-dadbod-ui", event = "VeryLazy" },


    {
        "Wansmer/treesj",
        keys = {
            { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false },
    },
    {
        'jghauser/follow-md-links.nvim',
        event = "VeryLazy",
    },
    {
        'famiu/bufdelete.nvim',
        keys = {
            { "<leader>c", "<cmd>Bdelete<cr>", desc = "Buf delete" },
        }
    }
}
