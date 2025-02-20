return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    event = "VeryLazy",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = { history = true, },
    config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        local s = ls.snippet
        local i = ls.insert_node

        local fmt = require("luasnip.extras.fmt").fmt

        ls.add_snippets("markdown", {
            s("py", fmt("```python\n{}\n```\n", { i(0) })),
            s("json", fmt("```json\n{}\n```\n", { i(0) })),
            s("pl", fmt("```plain\n{}\n```\n", { i(0) })),
            s("go", fmt("```go\n{}\n```\n", { i(0) })),
        })
    end,
}
