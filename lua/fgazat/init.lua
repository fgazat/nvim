vim.g.mapleader = " "

require("fgazat.set")
require("fgazat.remap")
require("fgazat.lazy_init")

local augroup = vim.api.nvim_create_augroup
local fgazatGroup = augroup('fgazat', {})

local autocmd = vim.api.nvim_create_autocmd


autocmd('LspAttach', {
    group = fgazatGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
    end
})



-- autocmds
autocmd('BufWinEnter', {
    pattern = { '*.md' },
    callback = function()
        vim.opt.textwidth = 80
        vim.opt.wrap = true
        vim.opt.linebreak = true
    end,
})

autocmd('BufWinLeave', {
    pattern = { '*.md' },
    callback = function()
        vim.opt.textwidth = 0
        vim.opt.wrap = false
        vim.opt.linebreak = false
    end,

})

vim.cmd [[ autocmd FileType help wincmd L ]]
-- vim.cmd [[ autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc ]]
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ filename = { ["ya.make"] = "cmake", }, })
