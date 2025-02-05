---@module "lazy"
---@type LazySpec
return {
    {
        "rshkarin/mason-nvim-lint",
        cond = not vim.g.vscode,
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-lint",
        },
        opts = {
            ensure_installed = {
                "hadolint",
                "actionlint",
                "htmlhint",
            },
            automatic_installation = false,
        },
    },
    {
        "mfussenegger/nvim-lint",
        cond = not vim.g.vscode,
        ft = { "dockerfile", "fennel", "fish", "ghaction", "html" },
        config = function()
            local augroup = require("jsfr.utils.augroup")
            local lint = require("lint")

            lint.linters_by_ft = {
                dockerfile = { "hadolint" },
                fennel = { "fennel" },
                fish = { "fish" },
                ghaction = { "actionlint" },
                html = { "htmlhint" },
            }

            vim.filetype.add({
                pattern = {
                    [".*/.github/workflows/.*%.ya?ml"] = "yaml.ghaction",
                },
            })

            augroup("NvimLintGroup", function(autocmd)
                autocmd("BufWritePost", {
                    pattern = "*",
                    callback = function()
                        lint.try_lint()
                    end,
                })
            end)
        end,
    },
}
