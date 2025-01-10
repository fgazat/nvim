return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        -- local diagnostics = null_ls.builtins.diagnostics

        return {
            debug = false,
            sources = {
                formatting.prettier.with {
                    disabled_filetypes = { "markdown", "svelte" },
                    extra_filetypes = { "toml", "solidity", "yaml", "json", "xml" },
                    extra_args = { "--single-quote", "--jsx-single-quote", "--print-width=120", "--prose-wrap=always" },
                },
                formatting.black.with { extra_args = { "--line-length=120" } },
                -- formatting.isort,

                formatting.gofmt,
                formatting.gofumpt,
                -- formatting.goimports,
                -- formatting.xmlformat,

                formatting.sql_formatter,
                formatting.buf,
                -- diagnostics.buf,
                -- formatting.sqlfluff.with { extra_args = {
                --     "--dialect",
                --     "sqlite",
                -- } },
                -- diagnostics.sqlfluff.with { extra_args = {
                --     "--dialect",
                --     "sqlite",
                -- } },
                -- formatting.go
                -- code_actions.shellchecklines,
                -- code_actions.gomodifytags,
                -- formatting.gofmt,
                -- formatting.stylua,
                -- diagnostics.flake8,
                -- diagnostics.mypy,
            },
        }
    end
}
