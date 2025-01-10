return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        "saadparwaiz1/cmp_luasnip",

        "lukas-reineke/cmp-under-comparator",

        'kristijanhusak/vim-dadbod-completion',

        "rafamadriz/friendly-snippets", -- a bunch of snippets to use,
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")

        require("luasnip.loaders.from_vscode").lazy_load()

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("mason").setup()

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup({
            ensure_installed = {
                "html",
                "lua_ls",
                -- "pylsp",
                "pyright",
                "bashls",
                "gopls",
                "marksman",
                "ts_ls",
                "templ",
                "htmx",
                "buf_ls",
                "tailwindcss",
                "svelte"
            },

            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                pyright = function()
                    lspconfig.pyright.setup {
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "off",

                                    -- diagnosticSeverityOverrides = {
                                    --     reportGeneralTypeIssues = "none",
                                    --     reportReturnType = "none",
                                    --     reportOptionalOperand = "none",
                                    --     reportOptionalMemberAccess = false,
                                    --     reportOptionalSubscript = "none",
                                    --     reportOptionalIterable = "none",
                                    --     reportAttributeAccessIssue = "none",
                                    -- }
                                },
                            },
                        },
                    }
                end,

                pylsp = function()
                    lspconfig.pylsp.setup {
                        autostart = false
                    }
                end,
                gopls = function()
                    local filter = {
                        "-",
                        "+infra/infractl/cli",
                        "+locdoc/doc_tools",
                        "+locdoc/doc_tools/yfm",
                        "+locdoc/libs/go",
                        "+locdoc/libs/gowiki",
                        "+locdoc/libs/godaas",
                        "+locdoc/projects/wl/back",
                        "+locdoc/projects/cashdesk/gobackend",
                        "+locdoc/doc/daas-farm/",
                        "+locdoc/doc/doccenter/go-sitemap",
                        "+junk/azat-fg",
                        "+billing/pepperoni",
                        "+billing/library/go",
                        "-library",
                        "+library/go",
                        "+tasklet",
                        "+sandbox/tasklet",
                        "+yt/go",
                        "+noc/go",
                        -- "+browser/backend/pkg/startrek"
                    }
                    if string.find(vim.api.nvim_buf_get_name(0), "/goarc") == nil then
                        filter = {}
                    end

                    lspconfig.gopls.setup {
                        cmd = { "/Users/azat-fg/.ya/tools/v4/gopls-darwin-arm64/gopls" },
                        capabilities = capabilities,
                        settings = {
                            gopls = {
                                experimentalPostfixCompletions = true,
                                analyses = {
                                    unusedparams = true,
                                    shadow = true,
                                },
                                hints = {
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    constantValues = true,
                                    functionTypeParameters = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                },
                                staticcheck = true,
                                -- usePlaceholders = true,
                                expandWorkspaceToModule = false,
                                directoryFilters = filter,
                            },
                        },
                    }
                end,
            }
        })


        cmp.setup({
            -- preselect = cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            -- completion = {
            --     autocomplete = false,
            -- },
            mapping = cmp.mapping.preset.insert {
                ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            },

            window = {
                -- documentation = false,
                documentation = {
                    border = "rounded",
                    winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
                },
                completion = {
                    border = "rounded",
                    winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
                },
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),

            sorting = {
                priority_weight = 2,
                comparators = {
                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.offset,
                    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        })
        cmp.setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            }
        })
        cmp.setup.filetype({ "markdown" }, {
            enabled = true,
            sources = {
                { name = "luasnip" },
                { name = "path" },
            },
        })


        local ls = require "luasnip"
        ls.config.set_config {
            history = false,
            updateevents = "TextChanged,TextChangedI",
        }

        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/user/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end

        vim.keymap.set({ "i", "s" }, "<c-l>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-h>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.diagnostic.config({

            virtual_text = false,
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            -- width = 100,
            -- height = 30,
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
            -- width = 100,
            -- height = 30,
        })
    end
}
