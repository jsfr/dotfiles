---@module "lazy"
---@type LazySpec
return {
    "williamboman/mason.nvim",
    cond = not vim.g.vscode,
    opts = {},
}
