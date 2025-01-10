-- vim.cmd [[
--     colorscheme habamax
--     highlight Normal guibg=none
--     highlight NonText guibg=none
--     highlight Normal ctermbg=none
--     highlight NonText ctermbg=none
-- ]]
-- return {}


return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            variant = "dark",
            disable_background = true,
            styles = {
                italic = false,
                transparency = true,
            },
        })

        vim.cmd("colorscheme rose-pine-moon")
    end

}
