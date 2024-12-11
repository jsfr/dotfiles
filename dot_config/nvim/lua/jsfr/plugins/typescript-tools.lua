return {
    "pmizio/typescript-tools.nvim",
    cond = not vim.g.vscode,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "dmmulroy/ts-error-translator.nvim",
        "nvim-lua/plenary.nvim",
    },
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    config = function()
        local typescript_tools = require("typescript-tools")
        local ts_error_translator = require("ts-error-translator")

        typescript_tools.setup({
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        })
        ts_error_translator.setup({})
    end,
}
