return {
    "pmizio/typescript-tools.nvim",
    cond = not vim.g.vscode,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "dmmulroy/ts-error-translator.nvim",
        "nvim-lua/plenary.nvim",
    },
    ft = { "typescript", "javascript" },
    config = function()
        local typescript_tools = require("typescript-tools")
        local ts_error_translator = require("ts-error-translator")

        typescript_tools.setup({})
        ts_error_translator.setup({})
    end,
}
