---@module "lazy"
---@type LazySpec
return {
    {
        "LittleEndianRoot/mason-conform",
        cond = not vim.g.vscode,
        lazy = true,
        dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
                "taplo",
                "prettier",
                "gofumpt",
                "goimports",
                "black",
            },
            automatic_installation = false,
            quiet_mode = false,
        },
    },
    {
        "stevearc/conform.nvim",
        cond = not vim.g.vscode,
        dependencies = {
            "LittleEndianRoot/mason-conform",
        },
        event = { "BufReadPre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>F",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                        timeout_ms = 1000,
                    })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 1000,
            },
            formatters_by_ft = {
                typescript = { "prettier" },
                javascript = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
                css = { "prettier" },
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
                fish = { "fish_indent" },
                python = { "black", lsp_format = "first" },
                ["_"] = { "trim_newlines", "trim_whitespace" },
            },
        },
    },
}
