return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {
                signs = false,
            }
        }
    },
    keys = {
        { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>",           desc = "diagnostics" },
        { "<leader>lw", "<cmd>Telescope diagnostics<cr>",                   desc = "diagnostics" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "symbols" },
        { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "symbols workspace" },
        { "gr",         "<cmd>Telescope lsp_references<cr>",                desc = "Lsp references" },
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
    },
    opts = {
        defaults = { file_ignore_patterns = { "node_modules" } }
    }
}


-- {
--     "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
--     dir = "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
--     config = function()
--         require('telescope').load_extension('arc')
--     end
-- },
-- keymap('n', '<leader>as', function()
--     require('telescope').extensions.arc.status({})
-- end)
-- keymap('n', '<leader>ab', function()
--     require('telescope').extensions.arc.branches({})
-- end)
-- keymap('n', '<leader>ap', function()
--     require('telescope').extensions.arc.pr_list({})
-- end)
-- keymap('n', '<leader>at', function()
--     require('telescope').extensions.arc.stash({})
-- end)
--
