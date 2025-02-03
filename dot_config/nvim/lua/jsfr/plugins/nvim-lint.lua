---@module "lazy"
---@type LazySpec
return {
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
}
