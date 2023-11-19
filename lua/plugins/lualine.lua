return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = false,
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = { 'NeogitStatus', 'Packer', 'Alpha' },
            },
            sections = {
                lualine_a = { 'branch' },
                lualine_b = {
                    {
                        'filename',
                        path = 1,
                    }
                },
                lualine_c = { 'diagnostics' },
                lualine_x = { 'diff' },
                lualine_y = { 'encoding' },
                lualine_z = { 'location' },
            },
        }
    end
}
