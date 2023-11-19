return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
        local keymap = vim.keymap.set

        -- Code action
        keymap({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>")
        -- Rename all occurrences of the hovered word for the selected files
        --
        keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
        --
        -- Toggle outline
        keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>")

        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

        keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
        return {
            lightbulb = {
                enable = false,
            },

            finder = {
                max_height = 0.5,
                min_width = 30,
                force_max_height = false,
                keys = {
                    jump_to = 'p',
                    expand_or_jump = 'o',
                    vsplit = 's',
                    split = 'i',
                    tabe = 't',
                    tabnew = 'r',
                    quit = { 'q', '<ESC>' },
                    close_in_preview = '<ESC>',
                },
            },
        }
    end
}
