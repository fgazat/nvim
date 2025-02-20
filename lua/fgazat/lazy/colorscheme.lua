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
        vim.cmd("colorscheme rose-pine-main")
        vim.cmd("highlight Visual guibg=#285577 guifg=white")
    end
}
