return {
    settings = {
        python = {
            -- exclude = { '.venv' },
            -- venvPath = ".",
            -- venv = ".venv",
            analysis = {
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "none",
                    reportReturnType = "none",
                    reportOptionalMemberAccess = "none",
                    reportOptionalOperand = "none",
                    reportOptionalSubscript = "none",
                    reportOptionalIterable = "none",
                    reportAttributeAccessIssue = "none",
                }
            },
        },
    },
}
