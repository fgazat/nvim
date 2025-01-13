return {
    {
        'stevearc/aerial.nvim',
        opts = {},
        event = "VeryLazy",
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            { "<leader>o", "<cmd>AerialToggle<cr>", desc = "Outline" },
        }
    },

}
