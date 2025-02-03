---@module "lazy"
---@type LazySpec
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    cond = not vim.g.vscode,
}
