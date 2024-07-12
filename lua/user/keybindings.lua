local keymap = vim.keymap.set

keymap('n', 'Q', '<nop>')
keymap('n', 'q:', '<nop>')

-- better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("", "<space>", "<nop>")

keymap('i', '<c-h>', "<nop>")
keymap('n', 'T', "<cmd>tag<cr>")
keymap('i', '<c-l>', "<nop>")
keymap('i', '<c-.>', "<c-^>", { noremap = true, silent = true })
keymap({ "i", "n" }, "<F1>", "<nop>")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

keymap("n", "<C-w>x", "<C-w>c")

-- LSP keys
keymap("n", "<leader>xx", "<cmd>Trouble<cr>")
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>")

keymap("n", "<leader>h", vim.cmd.nohlsearch)
keymap("n", "<leader>c", vim.cmd.Bdelete)

keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP keymaps
keymap("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end)
keymap("n", "<leader>lr", "<cmd>LspRestart<CR>")
keymap("n", "<leader>lce", "<cmd>lua require('cmp').setup.buffer { enabled = true }<CR>")
keymap("n", "<leader>lcd", "<cmd>lua require('cmp').setup.buffer { enabled = false }<CR>")
-- local job = vim.fn.jobstart('echo hello', {})

keymap('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- keymap('n', '<C-p>', builtin.git_files, {})


keymap({ "n", "v", "i" }, "<S-Up>", "<Up>")
keymap({ "n", "v", "i" }, "<S-Down>", "<Down>")


keymap("n", "gD", vim.lsp.buf.declaration)
keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "gI", vim.lsp.buf.implementation)
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "gs", vim.lsp.buf.signature_help)
keymap("n", "<leader>la", vim.lsp.buf.code_action)
keymap("n", "<leader>rn", vim.lsp.buf.rename)


keymap("n", "<M-f>", "<cmd>Format<cr>")
-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "+", [[<cmd>vertical resize -5<cr>]])
-- vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
-- vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
-- vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
-- vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
-- vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
--
-- keymap("n", "<leader>e", "<cmd>:Ex<cr>")
-- keymap("n", "-", "<cmd>:Ex<cr>")
keymap("n", "<leader>e", "<cmd>:Oil<cr>")
keymap("n", "-", "<cmd>:Oil<cr>")
-- keymap("n", "<leader>e", "<cmd>:lua MiniFiles.open()<cr>")
-- keymap("n", "-", "<cmd>:lua MiniFiles.open()<cr>")
