return {
    pylsp = {
        plugins = {
            pycodestyle = {
                maxLineLength = 120
            },
            jedi_completion = {
                include_params = true, -- Enables function signature completion
            },
        }
    }
}
