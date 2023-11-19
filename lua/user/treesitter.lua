local configs = require 'nvim-treesitter.configs'
configs.setup {
    ensure_installed = 'all',
    -- установка phpdoc падает на m1
    ignore_install = { 'phpdoc', 'smali' },
    highlight = { -- enable highlighting
        enable = true,
    },
    indent = {
        enable = false, -- default is disabled anyways
    },
}
