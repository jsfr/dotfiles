return {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>=",
            function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                    timeout_ms = 500,
                })
            end,
        },
    },
    opts = {
        format_on_save = {
            lsp_format = "never",
            timeout_ms = 500,
        },
        formatters_by_ft = {
            typescript = { "prettier" },
            javascript = { "prettier" },
            html = { "prettier" },
            markdown = { "prettier" },
            json = { "prettier" },
            sh = { "shfmt" },
            cs = { "csharpier" },
            lua = { "stylua" },
            toml = { "taplo" },
            go = { "gofumpt", "goimports" },
        },
    },
}
