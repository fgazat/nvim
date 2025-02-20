local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 1,
    conceallevel = 0,
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
    autoindent = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    wrapmargin = 0,
    scrolloff = 8,
    sidescrolloff = 8,
}

vim.opt.fillchars = vim.opt.fillchars + 'eob: '

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.formatoptions = 'jcroqlnt'
