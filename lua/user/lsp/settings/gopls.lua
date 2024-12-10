local util = require "lspconfig.util"


-- local filter = {}

local filter = {
    "-",
    "+infra/infractl/cli",
    "+locdoc/doc_tools",
    "+locdoc/doc_tools/yfm",
    "+locdoc/libs/go",
    "+locdoc/libs/gowiki",
    "+locdoc/libs/godaas",
    "+locdoc/projects/wl/back",
    "+locdoc/projects/cashdesk/gobackend",
    "+locdoc/doc/daas-farm/",
    "+locdoc/doc/doccenter/go-sitemap",
    "+junk/azat-fg",
    "+billing/pepperoni",
    "+billing/library/go",
    "-library",
    "+library/go",
    "+tasklet",
    "+sandbox/tasklet",
    "+yt/go",
    "+noc/go",
    -- "+browser/backend/pkg/startrek"
}
if string.find(vim.api.nvim_buf_get_name(0), "/goarc") == nil then
    filter = {}
end

return {
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = { unusedparams = true, unusedwrite = true, shadow = true },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            expandWorkspaceToModule = false,
            directoryFilters = filter,
        },
    },
}
