-- return {
--     'navarasu/onedark.nvim',
--     config = function()
--         require('onedark').setup {
--             style = 'warm',
--             transparent = true,
--         }
--         require('onedark').load()
--     end
-- }


return {
    -- {
    --     "folke/tokyonight.nvim",
    --     config = function()
    --         require("tokyonight").setup({
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    --             transparent = true,     -- Enable this to disable setting the background color
    --             terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    --             styles = {
    --                 -- Style to be applied to different syntax groups
    --                 -- Value is any valid attr-list value for `:help nvim_set_hl`
    --                 comments = { italic = false },
    --                 keywords = { italic = false },
    --                 -- Background styles. Can be "dark", "transparent" or "normal"
    --                 sidebars = "dark", -- style for sidebars, see below
    --                 floats = "dark",   -- style for floating windows
    --             },
    --         })
    --     end
    -- },

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
            function ColorMyPencils(color)
                color = color or "rose-pine"
                vim.cmd.colorscheme(color)
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end

            vim.cmd("colorscheme rose-pine")

            -- ColorMyPencils()
        end
    },


}


-- return {
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




-- return {
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
