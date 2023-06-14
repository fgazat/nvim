vim.cmd.colorscheme "catppuccin-mocha"
-- vim.cmd.colorscheme "nightfox"
local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 1,
    completeopt = { "menu", "menuone" },
    conceallevel = 0,
    colorcolumn = "120",
    fileencoding = "utf-8",
    encoding = "utf-8",
    hidden = true,
    pumheight = 20,
    showmode = false,
    softtabstop = 4,
    shiftwidth = 4,
    tabstop = 4,
    showtabline = 0,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 400,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    cursorline = true,
    number = true,
    laststatus = 3,
    showcmd = true,
    ruler = false,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    wrapmargin = 5,
    scrolloff = 8,
    sidescrolloff = 8,
    textwidth = 0,
}

vim.opt.fillchars = vim.opt.fillchars + 'eob: '

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end
