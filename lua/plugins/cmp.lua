return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        dependencies = {
            "onsails/lspkind.nvim",

            -- "lukas-reineke/cmp-under-comparator",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",         --snippet engine,
            "saadparwaiz1/cmp_luasnip", -- snippet completions,
            'kristijanhusak/vim-dadbod-completion',
            -- 'hrsh7th/cmp-nvim-lsp-signature-help',
            -- "hrsh7th/cmp-cmdline",
            -- "hrsh7th/cmp-emoji",
            -- "hrsh7th/cmp-nvim-lua",
            "rafamadriz/friendly-snippets", -- a bunch of snippets to use,
        },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.opt.shortmess:append "c"

            local lspkind = require "lspkind"
            lspkind.init {}

            local cmp = require "cmp"
            local compare = require "cmp.config.compare"

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup {
                -- completion = {
                --     autocomplete = false,
                -- },
                preselect = cmp.PreselectMode.None,
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true, }, { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                    -- { name = "nvim_lsp_signature_help" },
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
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        -- require("copilot_cmp.comparators").prioritize,
                        -- require("copilot_cmp.comparators").score,
                        compare.offset,
                        compare.exact,
                        -- compare.scopes,
                        compare.score,

                        -- require("cmp-under-comparator").under,
                        compare.recently_used,
                        compare.locality,
                        -- compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                        -- require("copilot_cmp.comparators").prioritize,
                        -- require("copilot_cmp.comparators").score,
                    },
                },
                -- sorting = {
                --     comparators = {
                --         cmp.config.compare.offset,
                --         cmp.config.compare.exact,
                --         cmp.config.compare.score,
                --         cmp.config.compare.recently_used,
                --         require("cmp-under-comparator").under,
                --         cmp.config.compare.kind,
                --     },
                -- },
            }

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
                -- mapping = cmp.mapping.preset.insert {
                --     -- ["<CR>"] = cmp.mapping.confirm { select = true },
                -- }
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
        end
    },
    -- {
    --     "nvim-cmp",
    --     dependencies = {
    --         {
    --             "garymjr/nvim-snippets",
    --             opts = {
    --                 friendly_snippets = true,
    --             },
    --             dependencies = { "rafamadriz/friendly-snippets" },
    --         },
    --     },
    --     opts = function(_, opts)
    --         opts.snippet = {
    --             expand = function(item)
    --                 return LazyVim.cmp.expand(item.body)
    --             end,
    --         }
    --         if LazyVim.has("nvim-snippets") then
    --             table.insert(opts.sources, { name = "snippets" })
    --         end
    --     end,
    --     keys = {
    --         {
    --             "<Tab>",
    --             function()
    --                 return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
    --             end,
    --             expr = true,
    --             silent = true,
    --             mode = { "i", "s" },
    --         },
    --         {
    --             "<S-Tab>",
    --             function()
    --                 return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
    --             end,
    --             expr = true,
    --             silent = true,
    --             mode = { "i", "s" },
    --         },
    --     },
    -- },
}
