vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

keymap('n', 'Q', '<nop>')

-- better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<leader>pv", vim.cmd.Ex)

-- keymap('n', '<c-j>', "<c-w>j")
-- keymap('n', '<c-h>', "<c-w>h")
keymap('i', '<c-h>', "<nop>")
-- keymap('n', '<c-k>', "<c-w>k")
-- keymap('n', '<c-l>', "<c-w>l")
keymap('i', '<c-l>', "<nop>")
keymap("", "<space>", "<nop>")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- LSP keys
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<leader>c", "<cmd>Bdelete!<cr>")
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>")
keymap("n", "<leader>xx", "<cmd>Trouble<cr>")
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>")

keymap("n", "<leader>h", vim.cmd.nohlsearch)
keymap("n", "<leader>a", vim.cmd.Alpha)
keymap("n", "<leader>c", vim.cmd.Bdelete)

keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP keymaps
keymap("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end)
keymap("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")
keymap("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>")
keymap("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>")
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
keymap("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
keymap("n", "<leader>lo", vim.cmd.SymbolsOutline)


keymap('n', '<leader><F5>', vim.cmd.UndotreeToggle)
-- Markdown

keymap("n", "<leader>mp", vim.cmd.MarkdownPreview)
keymap("n", "<leader>ms", vim.cmd.MarkdownPreviewStop)

keymap("n", "<leader>e", "<cmd>:NvimTreeToggle<cr>", opts)



local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
keymap('n', '<leader>f', function()
    builtin.find_files(themes.get_dropdown({ previewer = false }))
end)
keymap('n', '<C-p>', builtin.git_files, {})

keymap("n", "<leader>b", function()
    builtin.buffers(themes.get_dropdown({ previewer = false, sort_lastused = true }))
end)

keymap('n', '<leader>F', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)




-- LSPSAGA bad
-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
-- keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
-- keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
--
-- keymap("n", "[D", function()
--     require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
-- keymap("n", "]D", function()
--     require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })


keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "gD", vim.lsp.buf.declaration)
keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "gI", vim.lsp.buf.implementation)
keymap("n", "gr", builtin.lsp_references)
keymap("n", "gi", builtin.lsp_incoming_calls)
keymap("n", "go", builtin.lsp_outgoing_calls)
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "gs", vim.lsp.buf.signature_help)
keymap("n", "<leader>la", vim.lsp.buf.code_action)
keymap("n", "<leader>rn", vim.lsp.buf.rename)

-- keymap("n", "gl", vim.diagnostic.open_float)
keymap("n", "gl", builtin.diagnostics)

keymap("n", "<M-f>", "<cmd>Format<cr>")
-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
