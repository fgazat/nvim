return {

    "nvimtools/none-ls.nvim",
    lazy = true,
    opts = function()
        null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        return {
            debug = false,
            sources = {
                formatting.prettier.with {
                    disabled_filetypes = { "markdown" },
                    extra_filetypes = { "toml", "solidity", "yaml", "json" },
                    extra_args = { "--single-quote", "--jsx-single-quote", "--print-width=120", "--prose-wrap=always" },
                },
                formatting.eslint,
                formatting.black.with { extra_args = { "--line-length=120" } },
                formatting.isort,

                formatting.gofmt,
                formatting.gofumpt,
                -- formatting.goimports,

                formatting.shfmt,
                -- formatting.go
                diagnostics.shellcheck, -- shell script diagnostics
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
