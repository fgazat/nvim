local util = require "lspconfig.util"

return {
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    cmd = {
        "gopls",
        "-debug=:8080",
        "-rpc.trace",
    },
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
            expandWorkspaceToModule = false,
            directoryFilters = {
                "-",
                "+locdoc/doc_tools",
                "+tasklet",
                "+sandbox/tasklet"
            },
            subdirWatchPatterns = "on"
        },
    },
}
