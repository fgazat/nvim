return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
        return {
            transparent = true,
            styles = {
                sidebars = "transparent",
            },
        }
    end,
}

-- return {
--     "catppuccin/nvim",
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha",                 -- latte, frappe, macchiato, mocha
--             transparent_background = true,     -- disables setting the background color.
--         })
--     end
-- }
--
-- {
--     "rebelot/kanagawa.nvim",
--     config = function()
--         require('kanagawa').setup({})
--     end
-- },
