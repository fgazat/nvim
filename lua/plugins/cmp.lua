return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lua",

        "L3MON4D3/LuaSnip",           --snippet engine,
        "rafamadriz/friendly-snippets", -- a bunch of snippets to use,
        "saadparwaiz1/cmp_luasnip",   -- snippet completions,
    }
}
