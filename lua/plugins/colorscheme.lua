return {
    -- {
    --     'navarasu/onedark.nvim',
    --     config = function()
    --         require('onedark').setup {
    --             style = 'warm',
    --             transparent = true,
    --         }
    --         require('onedark').load()
    --     end
    -- },
    -- {
    --     "sainnhe/gruvbox-material",
    --     priority = 1000,
    --     config = function()
    --         vim.o.background = "dark" -- or "light" for light mode
    --         vim.cmd("let g:gruvbox_material_background= 'hard'")
    --         vim.cmd("let g:gruvbox_material_transparent_background=2")
    --         vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
    --         vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
    --         vim.cmd("let g:gruvbox_material_enable_bold=1")
    --         vim.cmd("let g:gruvbox_material_enable_italic=1")
    --         vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
    --         -- changing bg and border colors
    --         vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    --         vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    --         vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    --     end,
    -- }

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                    transparency = true,
                },
            })

            vim.cmd("colorscheme rose-pine")
        end
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.o.background = "dark" -- or "light" for light mode
    --         -- vim.cmd("let g:gruvbox_material_background= 'hard'")
    --         -- vim.cmd("let g:gruvbox_material_transparent_background=2")
    --         -- vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
    --         -- vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
    --         -- vim.cmd("let g:gruvbox_material_enable_bold=1")
    --         -- vim.cmd("let g:gruvbox_material_enable_italic=1")
    --         require('tokyonight').setup({
    --             transparent = true,
    --             styles = {
    --                 -- Style to be applied to different syntax groups
    --                 -- Value is any valid attr-list value for `:help nvim_set_hl`
    --                 -- comments = { italic = true },
    --                 -- keywords = { italic = true },
    --                 -- functions = {},
    --                 -- variables = {},
    --                 -- Background styles. Can be "dark", "transparent" or "normal"
    --                 sidebars = "transparent", -- style for sidebars, see below
    --                 floats = "transparent",   -- style for floating windows
    --             },
    --         })
    --
    --         vim.cmd [[colorscheme tokyonight-night]]
    --         -- changing bg and border colors
    --         -- vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    --         -- vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    --         -- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    --     end
    --
    -- }

}
