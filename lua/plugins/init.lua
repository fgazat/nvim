return {
    {
        "moll/vim-bbye",
        cmd = "Bdelete"
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            vim.notify = require("notify")

            require("notify").setup({
                background_colour = "#000000",
            })
        end
    },


    -- DEBUG,
    -- { "mfussenegger/nvim-dap", lazy = true },
    -- { "rcarriga/nvim-dap-ui",  lazy = true },
    -- { "leoluz/nvim-dap-go",    lazy = true },
    -- Surround,

    {
        "tpope/vim-surround",
        event = "VeryLazy"
    },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
    },

    { 'echasnovski/mini.statusline', version = '*', config = true },

    -- TreeSitter.,
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            local configs = require 'nvim-treesitter.configs'
            configs.setup {
                ensure_installed = 'all',
                -- установка phpdoc падает на m1
                ignore_install = { 'phpdoc', 'smali' },
                highlight = { -- enable highlighting
                    enable = true,
                },
                indent = {
                    enable = false, -- default is disabled anyways
                },
            }
        end
    },
    -- Helping indent lines.,
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {

            scope = { enabled = false },
        },
    },

    { "preservim/tagbar",            lazy = true },
    { "neovim/nvim-lspconfig",       lazy = true },
    { "williamboman/mason.nvim",     lazy = true },
    { "mbbill/undotree" },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
        lazy = true

    },
    -- snippets,
    {
        "numToStr/Comment.nvim",
        config = true,
        event = "BufEnter",
        --    lazy = true

    },
    {
        'stevearc/oil.nvim',
        opts = {
            buf_options = {
                buflisted = true,
                bufhidden = "hide",
            },
        },
        config = function()
            -- hack to let netrw_gx work https://hello.ru
            local keymaps = {
                -- ["g?"] = "actions.show_help",
                -- ["<CR>"] = "actions.select",
                -- ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = false,
                ["<C-s>"] = false,
                -- ["<C-t>"] = "actions.select_tab",
                -- ["<C-p>"] = "actions.preview",
                -- ["<C-c>"] = "actions.close",
                -- ["<C-l>"] = "actions.refresh",
                -- ["-"] = "actions.parent",
                -- ["_"] = "actions.open_cwd",
                -- ["`"] = "actions.cd",
                -- ["~"] = "actions.tcd",
                -- ["gs"] = "actions.change_sort",
                -- ["gx"] = "actions.open_external",
                -- ["g."] = "actions.toggle_hidden",
                -- ["g\\"] = "actions.toggle_trash",
            }
            require("oil").setup({
                default_file_explorer = false,
                keymaps = keymaps,
            })

            require("oil.config").setup({
                default_file_explorer = true,
                keymaps = keymaps,
            })
            if vim.fn.exists("#FileExplorer") then
                vim.api.nvim_create_augroup("FileExplorer", { clear = true })
            end
        end,
        event = "Syntax",
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- {
    --     'windwp/nvim-autopairs',
    --     event = "InsertEnter",
    --     config = true,
    --     opts = {
    --         disable_filetype = { "TelescopePrompt", "spectre_panel" },
    --         disable_in_macro = true,       -- disable when recording or executing a macro
    --         disable_in_visualblock = true, -- disable when insert after visual block mode
    --         disable_in_replace_mode = true,
    --         ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    --         enable_moveright = true,
    --         enable_afterquote = false,         -- add bracket pairs after quote
    --         enable_check_bracket_line = false, --- check bracket in same line
    --         enable_bracket_in_quote = false,   --
    --         enable_abbr = false,               -- trigger abbreviation
    --         break_undo = true,                 -- switch for basic rule break undo sequence
    --         check_ts = false,
    --         map_cr = true,
    --         map_bs = false,  -- map the <BS> key
    --         map_c_h = false, -- Map the <C-h> key to delete a pair
    --         map_c_w = false  -- map <c-w> to delete a pair if possible
    --     }
    -- },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        keys = {
            -- { "<leader>ms", vim.cmd.MarkdownPreviewStop, desc = "Zen mode" },
            { "<leader>m", vim.cmd.MarkdownPreview, desc = "Zen mode" },
        },
        ft = { "markdown" },
    },
    -- {
    --     "preservim/vim-pencil",
    --     init = function()
    --         vim.g["pencil#wrapModeDefault"] = "soft"
    --         vim.g["pencil#autoformat"] = 1
    --     end,
    -- },
    { "tpope/vim-dadbod", },
    { "kristijanhusak/vim-dadbod-ui", },
    {
        "folke/zen-mode.nvim",
        opts = {
        },
        cmd = "ZenMode",
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
        }
    },
    'jghauser/follow-md-links.nvim',
    { 'echasnovski/mini.ai', version = '*', config = true },
    {
        'dhruvmanila/browser-bookmarks.nvim',
        version = '*',
        opts = {
            selected_browser = 'brave'
        },
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            { "<leader>a", vim.cmd.BrowserBookmarks, desc = "Zen mode" },
        }
    },
    "onsails/lspkind.nvim",
}
