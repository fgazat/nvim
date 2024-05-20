local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 1,
    conceallevel = 0,
    -- colorcolumn = "120",
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
    wrapmargin = 5,
    scrolloff = 8,
    sidescrolloff = 8,
    textwidth = 0,
    keymap = "russian-jcukenwin",
    iminsert = 0,
    imsearch = 0,
}

vim.opt.fillchars = vim.opt.fillchars + 'eob: '



for k, v in pairs(options) do
    vim.opt[k] = v
end
-- vim.g.netrw_preview    = 1
-- -- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize    = 20
-- vim.g.netrw_banner     = 0
-- vim.g.netrw_menu       = 0
-- vim.g.netrw_fastbrowse = 2

vim.cmd [[ autocmd FileType help wincmd L ]]
vim.filetype.add({ extension = { templ = "templ" } })
--
-- Display diagnostics as virtual text only if not in insert mode
-- vim.api.nvim_create_autocmd("InsertEnter", {
--     pattern = "*",
--     callback = function()
--         vim.diagnostic.config({
--             virtual_text = false,
--         })
--     end
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     pattern = "*",
--     callback = function()
--         vim.diagnostic.config({
--             virtual_text = true,
--         })
--     end
-- })
