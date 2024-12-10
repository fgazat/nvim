local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
    return
end

-- require("nvim-lsp-installer").setup {}

local servers = {
    "html",
    "lua_ls",
    "pylsp",
    -- "pyright",
    "bashls",
    "gopls",
    "marksman",
    "ts_ls",
    "templ",
    "htmx",
    "buf_ls",
    "tailwindcss",
    "svelte"
    -- "eslint",
    -- "sqlfluff"
    -- "checkmake",
}

local settings = {
    ensure_installed = servers,
    ui = {
        icons = {},
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },
    log_level = vim.log.levels.INFO,
}

lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}



for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
        local jsonls_opts = require "user.lsp.settings.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end


    if server == "templ" then
        local jsonls_opts = require "user.lsp.settings.templ"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "htmx" then
        local jsonls_opts = require "user.lsp.settings.htmx"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end
    if server == "tailwindcss" then
        local jsonls_opts = require "user.lsp.settings.tailwindcss"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "svelte" then
        local jsonls_opts = require "user.lsp.settings.svelte"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "yamlls" then
        local yamlls_opts = require "user.lsp.settings.yamlls"
        opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
    end

    if server == "lua_ls" then
        local sumneko_opts = require "user.lsp.settings.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "user.lsp.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "pylsp" then
        local pyright_opts = require "user.lsp.settings.pylsp"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "mypy" then
        local pyright_opts = require "user.lsp.settings.mypy"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "bashls" then
        local pyright_opts = require "user.lsp.settings.bash"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "groovyls" then
        local groovyls_opts = require "user.lsp.settings.groovyls"
        opts = vim.tbl_deep_extend("force", groovyls_opts, opts)
    end

    if server == "remark_ls" then
        local gopls_opts = require "user.lsp.settings.remark"
        opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    end

    if server == "gopls" then
        local gopls_opts = require "user.lsp.settings.gopls"
        opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    end

    if server == "buf_ls" then
        local gopls_opts = require "user.lsp.settings.buf"
        opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    end

    lspconfig[server].setup(opts)
    ::continue::
end

lspconfig.marksman.setup {}
