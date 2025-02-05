---@module "lazy"
---@type LazySpec
return {
    {
        "LittleEndianRoot/mason-conform",
        cond = not vim.g.vscode,
        dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
        opts = {
            ensure_installed = { "stylua", "shfmt", "taplo", "prettier", "gofumpt", "goimports" },
            automatic_installation = false,
            quiet_mode = false,
        },
    },
    {
        "stevearc/conform.nvim",
        cond = not vim.g.vscode,
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>F",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                        timeout_ms = 500,
                    })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
            formatters_by_ft = {
                typescript = { "prettier" },
                javascript = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
                html = { "prettier" },
                markdown = { "prettier" },
                json = { "prettier" },
                sh = { "shfmt" },
                cs = { "csharpier" },
                lua = { "stylua" },
                toml = { "taplo" },
                go = { "gofumpt", "goimports" },
                terraform = { "terraform_fmt" },
                nix = { "nixfmt" },
                -- nu = { "nufmt" },
            },
        },
    },
}
