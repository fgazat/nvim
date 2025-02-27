vim.g.mapleader = " "

require("fgazat.set")
require("fgazat.remap")
require("fgazat.lazy_init")

-- local augroup = vim.api.nvim_create_augroup
-- local fgazatGroup = augroup('fgazat', {})
--
local autocmd = vim.api.nvim_create_autocmd


-- autocmds
-- autocmd('BufWinEnter', {
--     pattern = { '*.md' },
--     callback = function()
--         vim.opt.textwidth = 120
--         vim.opt.wrap = true
--         vim.opt.linebreak = true
--     end,
-- })
--
-- autocmd('BufWinLeave', {
--     pattern = { '*.md' },
--     callback = function()
--         vim.opt.textwidth = 0
--         vim.opt.wrap = false
--         vim.opt.linebreak = false
--     end,
--
-- })


local toggle_mode = false -- Track the toggle state

-- Function to toggle the settings
local function toggle_md_mode()
    toggle_mode = not toggle_mode
    if toggle_mode then
        vim.opt.textwidth = 120
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.wo.conceallevel = 2
        print("Markdown mode enabled")
    else
        vim.opt.textwidth = 0
        vim.opt.wrap = false
        vim.opt.linebreak = false
        vim.wo.conceallevel = 0
        print("Markdown mode disabled")
    end
end

-- -- Autocmd to apply settings only if toggle_mode is enabled
-- autocmd('BufWinEnter', {
--     pattern = { '*.md' },
--     callback = function()
--         if toggle_mode then
--             vim.opt.textwidth = 120
--             vim.opt.wrap = true
--             vim.opt.linebreak = true
--             vim.wo.conceallevel = 2
--         end
--     end,
-- })
--
-- autocmd('BufWinLeave', {
--     pattern = { '*.md' },
--     callback = function()
--         if toggle_mode then
--             vim.opt.textwidth = 0
--             vim.opt.wrap = false
--             vim.opt.linebreak = false
--             vim.wo.conceallevel = 0
--         end
--     end,
-- })

vim.api.nvim_create_user_command('ToggleMdMode', toggle_md_mode, {})
vim.api.nvim_set_keymap('n', '<leader>tm', ':ToggleMdMode<CR>', { noremap = true, silent = true })

vim.cmd [[ autocmd FileType help wincmd L ]]
-- vim.cmd [[ autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc ]]
vim.api.nvim_command('autocmd VimResized * wincmd =')
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ filename = { ["ya.make"] = "cmake", }, })
