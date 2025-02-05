-- Lazy
return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        require("chatgpt").setup({
            openai_params = {
                model = "gpt-4o",
                max_tokens = 4095,
            }
        })
    end,
    keys = {
        { "<leader>g", "<cmd>ChatGPT<cr>", desc = "chatgpt" },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim", -- optional
        "nvim-telescope/telescope.nvim"
    }
}
