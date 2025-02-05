
return {
    -- {
    --     "craftzdog/solarized-osaka.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    {
        "rebelot/kanagawa.nvim",
        lazy=false,
        config = function()
            require('kanagawa').setup({
                compile = false,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,   -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {             -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",    -- Load "wave" theme when 'background' option is not set
                background = {     -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus"
                },
            })

            -- setup must be called before loading
            vim.cmd("colorscheme kanagawa")
        end
    }
}

--
-- return {
--     {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         lazy = false,
--         priority = 1000,
--         config = function()
--             require('rose-pine').setup({
--                 variant = "dark",
--                 disable_background = true,
--                 styles = {
--                     italic = false,
--                     transparency = true,
--                 },
--             })
--
--             vim.cmd("colorscheme rose-pine-moon")
--         end
--     },
--     -- {
--     --     "EdenEast/nightfox.nvim",
--     --     lazy = false,
--     --     priority = 1000,
--     --     config = function()
--     --         require('nightfox').setup({
--     --             options = {
--     --                 variant = "dark",
--     --                 transparent = true,
--     --             }
--     --         })
--     --
--     --         vim.cmd("colorscheme nightfox")
--     --     end
--     -- }
--
-- }
