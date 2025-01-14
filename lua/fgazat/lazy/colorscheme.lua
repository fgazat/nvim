-- vim.cmd [[
--     colorscheme habamax
--     highlight Normal guibg=none
--     highlight NonText guibg=none
--     highlight Normal ctermbg=none
--     highlight NonText ctermbg=none
-- ]]
-- return {}

function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
