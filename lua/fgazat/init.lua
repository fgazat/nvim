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
