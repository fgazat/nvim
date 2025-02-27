return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim", -- optional
        "nvim-telescope/telescope.nvim"
    },
    opts = {
        -- this config assumes you have OPENAI_API_KEY environment variable set
        openai_params = {
            model = "gpt-4o",
            frequency_penalty = 0,
            presence_penalty = 0,
            max_tokens = 4095,
            temperature = 0.2,
            top_p = 0.1,
            n = 1,
        },
        chat = {
            default_system_message = "",
            loading_text = "Loading, please wait ...",
            question_sign = "", -- 🙂
            answer_sign = "ﮧ", -- 🤖
            border_left_sign = "",
            border_right_sign = "",
            max_line_length = 120,
            sessions_window = {
                active_sign = "  ",
                inactive_sign = "  ",
                current_line_sign = "",
                border = {
                    style = "rounded",
                    text = {
                        top = " Sessions ",
                    },
                },
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                },
            },
            keymaps = {
                close = "<C-c>",
                close_n = "<Esc>",
                yank_last = "<C-y>",
                yank_last_code = "<C-k>",
                scroll_up = "<C-u>",
                scroll_down = "<C-d>",
                new_session = "<C-n>",
                cycle_windows = "<Tab>",
                cycle_modes = "<C-f>",
                next_message = "<C-j>",
                prev_message = "<C-k>",
                select_session = "<Space>",
                rename_session = "r",
                delete_session = "d",
                draft_message = "<C-r>",
                edit_message = "e",
                delete_message = "d",
                toggle_settings = "<C-o>",
                toggle_sessions = "<C-p>",
                toggle_help = "g?",
                toggle_message_role = "<C-r>",
                toggle_system_role_open = "<C-s>",
                stop_generating = "<C-x>",
            },

        },
        popup_layout = {
            default = "center",
            center = {
                width = "50%",
                height = "80%",
            },
            right = {
                width = "30%",
                width_settings_open = "50%",
            },
        },
    },
    keys = {

        { "<leader>g", "<cmd>ChatGPT<cr>", desc = "chat gpt" },
    },
    config = true,
}
