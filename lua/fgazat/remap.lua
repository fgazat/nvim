vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 'q:', '<nop>')

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("", "<space>", "<nop>")


-- vim.keymap.set('i', '<c-h>', "<nop>")
vim.keymap.set('i', '<c-h>', '<BS>', { noremap = true, silent = true })
vim.keymap.set('n', 'T', "<cmd>tag<cr>")
vim.keymap.set('i', '<c-l>', "<nop>")
vim.keymap.set('i', '<c-.>', "<c-^>", { noremap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<F1>", "<nop>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-w>x", "<C-w>c")

-- LSP keys
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>")
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>")

vim.keymap.set("n", "<leader>h", vim.cmd.nohlsearch)

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP keymaps
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end)

vim.keymap.set("n", "<leader>lr", function()
    vim.cmd("LspRestart")
    vim.diagnostic.reset()
    vim.notify("LSP restarted")
end)
-- vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>")
vim.keymap.set("n", "<leader>lce", "<cmd>lua require('cmp').setup.buffer { enabled = true }<CR>")
vim.keymap.set("n", "<leader>lcd", "<cmd>lua require('cmp').setup.buffer { enabled = false }<CR>")



vim.keymap.set({ "n", "v", "i" }, "<S-Up>", "<Up>")
vim.keymap.set({ "n", "v", "i" }, "<S-Down>", "<Down>")


vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help)


vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)


vim.keymap.set("n", "+", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "=", [[<cmd>vertical resize -5<cr>]])
--
vim.keymap.set("n", "<leader>mc", function()
    vim.wo.conceallevel = vim.wo.conceallevel == 0 and 2 or 0
end, { silent = true })
