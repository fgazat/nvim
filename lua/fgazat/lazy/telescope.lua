return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "folke/todo-comments.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
                opts = {
                    signs = false,
                }
            },
            -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        keys = {
            { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>",           desc = "diagnostics" },
            { "<leader>lw", "<cmd>Telescope diagnostics<cr>",                   desc = "diagnostics" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "symbols" },
            { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "symbols workspace" },
            { "gr",         "<cmd>Telescope lsp_references<cr>",                desc = "Lsp references" },
            { "gd",         "<cmd>Telescope lsp_definitions<cr>",               desc = "Lsp defenitions" },
            { "gi",         "<cmd>Telescope lsp_incoming_calls<cr>",            desc = "Lsp incoming calls" },
            { "go",         "<cmd>Telescope lsp_outgoing_calls<cr>",            desc = "Lsp outgoing calls" },
            { "gl",         "<cmd>Telescope diagnostics<cr>",                   desc = "diagnostics" },
            { "<leader>tt", "<cmd>Telescope todo-comments<cr>",                 desc = "diagnostics" },
            {
                "<leader>f",
                function()
                    require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))
                end,
                desc = "Find files",
            },
            {
                "<leader>F",
                function()
                    vim.ui.input({ prompt = ' Grep > ' }, function(value)
                        require('telescope.builtin').grep_string({ search = value })
                    end)
                    -- require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Grep files",
            },
            {
                "<leader>S",
                function()
                    require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })
                end,
                desc = "Grep files",
            },
            {
                "<leader>b",
                function()
                    require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false, sort_lastused = true }))
                end,
                desc = "Find buffers",
            },
            {
                "gi",
                function()
                    require('telescope.builtin').lsp_implementations(require('telescope.themes').get_dropdown({ previewer = false, sort_lastused = true }))
                end,
                desc = "Find buffers",
            },
        },
        opts = {
            defaults = { file_ignore_patterns = { "node_modules" } }
        },
        config = function()
            actions = require("telescope.actions")
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous
                        }
                    }
                }
                -- extensions = {
                --     fzf = {
                --         fuzzy = true,                   -- false will only do exact matching
                --         override_generic_sorter = true, -- override the generic sorter
                --         override_file_sorter = true,    -- override the file sorter
                --         case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                --         -- the default case_mode is "smart_case"
                --     }
                -- }
            }
            -- require('telescope').load_extension('fzf')
        end
    },
}
