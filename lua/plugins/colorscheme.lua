-- return {
--     "craftzdog/solarized-osaka.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = function()
--         return {
--             transparent = true,
--             styles = {
--                 sidebars = "transparent",
--                 floats = "transparent",
--             },
--         }
--     end,
--     config = function()
--         vim.cmd([[colorscheme solarized-osaka]]) -- Set color scheme
--     end
-- }
--


-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = true,
--     opts = function()
--         return {
--             terminal_colors = true, -- add neovim terminal colors
--             undercurl = true,
--             underline = true,
--             bold = true,
--             italic = {
--                 strings = true,
--                 emphasis = true,
--                 comments = true,
--                 operators = false,
--                 folds = true,
--             },
--             strikethrough = true,
--             invert_selection = false,
--             invert_signs = false,
--             invert_tabline = false,
--             invert_intend_guides = false,
--             inverse = true, -- invert background for search, diffs, statuslines and errors
--             contrast = "",  -- can be "hard", "soft" or empty string
--             palette_overrides = {},
--             overrides = {},
--             dim_inactive = false,
--             transparent_mode = true,
--         }
--     end
--
--     -- "catppuccin/nvim",
--     -- config = function()
--     --     require("catppuccin").setup({
--     --         flavour = "mocha",             -- latte, frappe, macchiato, mocha
--     --         transparent_background = true, -- disables setting the background color.
--     --     })
--     -- end
--
--
--
--     -- "rebelot/kanagawa.nvim",
--     -- config = function()
--     --     require('kanagawa').setup({})
--     -- end
-- }

return {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
        vim.o.background = "dark" -- or "light" for light mode
        vim.cmd("let g:gruvbox_material_background= 'hard'")
        vim.cmd("let g:gruvbox_material_transparent_background=2")
        vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
        vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
        vim.cmd("let g:gruvbox_material_enable_bold=1")
        vim.cmd("let g:gruvbox_material_enable_italic=1")
        vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
        -- changing bg and border colors
        vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
        vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
        vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    end,
}
