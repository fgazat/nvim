return {
    init_options = {
        completion = {
            -- disable_snippets = true,
            resolve_eagerly = false,
        },
        diagnostics = {
            enable = false,
        },
        hover = {
            enable = true,
        },
        workspace = {
            extraPaths = {
                "./__pypackages__/3.10/lib",
                "./__pypackages__/3.11/lib",
                "./src",
            },
            symbols = {
                ignoreFolders = { "__pypackages__", "__pycache__", "venv" },
                maxSymbols = 20
            }
        }
    }
}
