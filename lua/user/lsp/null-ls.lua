local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
    debug = false,
    sources = {
        formatting.prettier.with {
            extra_filetypes = { "toml", "solidity", "markdown" },
            -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
            extra_args = { "--single-quote", "--jsx-single-quote", "--print-width 120" },
        },
        formatting.eslint,
        formatting.black.with { extra_args = { "--line-length=120" } },
        formatting.isort,

        formatting.gofmt,
        formatting.gofumpt,
        formatting.shfmt,
        -- formatting.go
        diagnostics.shellcheck, -- shell script diagnostics
        -- code_actions.shellchecklines,
        -- code_actions.gomodifytags,
        formatting.goimports,
        -- formatting.gofmt,
        -- formatting.stylua,
        -- diagnostics.flake8,
        -- diagnostics.mypy,
    },
}
