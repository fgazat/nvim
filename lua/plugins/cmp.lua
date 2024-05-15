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
        "L3MON4D3/LuaSnip",             --snippet engine,
        "rafamadriz/friendly-snippets", -- a bunch of snippets to use,
        "saadparwaiz1/cmp_luasnip",     -- snippet completions,
        'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end

        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then
            return
        end

        local buffer_fts = {
            "toml",
            "yaml",
            "json",
        }

        local function contains(t, value)
            for _, v in pairs(t) do
                if v == value then
                    return true
                end
            end
            return false
        end

        local compare = require "cmp.config.compare"

        require("luasnip/loaders/from_vscode").lazy_load()

        -- local check_backspace = function()
        --   local col = vim.fn.col "." - 1
        --   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        -- end

        local check_backspace = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
        end


        vim.g.cmp_active = true

        cmp.setup {
            enabled = function()
                local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
                if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
                    return false
                end
                local context = require("cmp.config.context")
                return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
            end,
            preselect = cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ["<C-c>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<m-j>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<m-k>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<m-c>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<S-CR>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
                -- ["<Right>"] = cmp.mapping.confirm { select = true },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<C-h>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<C-l>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) and luasnip.in_snippet() then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
            },
            -- sources = cmp.config.sources {
            --     -- { name = "nvim_lsp_signature_help" },
            --     { name = "cmp_tabnine", priority = 8 },
            --     { name = "nvim_lsp",    priority = 8 },
            --     { name = "ultisnips",   priority = 7 },
            --     { name = "buffer",      priority = 7 },                                                 -- first for locality sorting?
            --     { name = "spell",       keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] },
            --     { name = "dictionary",  keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] }, -- from uga-rosa/cmp-dictionary plug
            --     -- { name = 'rg'},
            --     { name = "nvim_lua",    priority = 5 },
            --     -- { name = 'path' },
            --     { name = "fuzzy_path",  priority = 4 }, -- from tzacher
            --     { name = "calc",        priority = 3 },
            -- },
            -- sorting = {
            --     priority_weight = 1.0,
            --     comparators = {
            --         -- compare.score_offset, -- not good at all
            --         compare.locality,
            --         compare.recently_used,
            --         compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            --         compare.offset,
            --         compare.order,
            --         -- compare.scopes, -- what?
            --         -- compare.sort_text,
            --         -- compare.exact,
            --         -- compare.kind,
            --         -- compare.length, -- useless
            --     },
            -- },
            sources = {
                {
                    name = "nvim_lsp",
                    filter = function(entry, ctx)
                        local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                            return true
                        end

                        if kind == "Text" then
                            return true
                        end
                    end,
                    group_index = 2,
                },
                { name = "nvim_lua", group_index = 2 },
                { name = "luasnip",  group_index = 2 },
                {
                    name = "buffer",
                    group_index = 2,
                    filter = function(entry, ctx)
                        if not contains(buffer_fts, ctx.prev_context.filetype) then
                            return true
                        end
                    end,
                },
                { name = "path",           group_index = 2 },
                { name = "emoji",          group_index = 2 },
                { name = "lab.quick_data", keyword_length = 4, group_index = 2 },
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
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
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
            experimental = {
                ghost_text = true,
            },
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
            mapping = cmp.mapping.preset.insert {
                ["<CR>"] = cmp.mapping.confirm { select = true },
            }
        })
    end
}
