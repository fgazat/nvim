local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- local yoimports = {
--     method = null_ls.methods.FORMATTING,
--     filetypes = { "go" },
--     generator = null_ls.formatter({
--         command = "/Users/azat-fg/.ya/tools/v4/5199588783/yoimports",
--         args = { "-w", '$FILENAME' },
--         to_stdin = true,
--         from_stderr = true,
--     }),
-- }
-- null_ls.register(yoimports)

null_ls.setup {
    debug = false,
    sources = {
        formatting.prettier.with {
            extra_filetypes = { "toml", "solidity", "markdown" },
            -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
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

-- null_ls.register(yoimports)
