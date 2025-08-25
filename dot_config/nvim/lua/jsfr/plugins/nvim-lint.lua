---@module "lazy"
---@type LazySpec
return {
    {
        "mfussenegger/nvim-lint",
        dependencies = {
            {
                "rshkarin/mason-nvim-lint",
                lazy = true,
                dependencies = {
                    "williamboman/mason.nvim",
                    "mfussenegger/nvim-lint",
                },
                opts = {
                    ensure_installed = {
                        "hadolint",
                        "actionlint",
                        "htmlhint",
                        "write_good",
                        "proselint",
                        "vale",
                    },
                    automatic_installation = false,
                },
            },
        },
        ft = { "dockerfile", "fish", "ghaction", "html", "css", "markdown" },
        config = function()
            local augroup = require("jsfr.utils.augroup")
            local lint = require("lint")

            lint.linters_by_ft = {
                dockerfile = { "hadolint" },
                fish = { "fish" },
                ghaction = { "actionlint" },
                html = { "htmlhint" },
                markdown = { "write_good", "proselint", "vale" },
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
