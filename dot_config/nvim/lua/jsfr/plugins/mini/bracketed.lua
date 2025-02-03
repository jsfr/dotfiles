---@module "lazy"
---@type LazySpec
return {
    "echasnovski/mini.bracketed",
    cond = not vim.g.vscode,
    opts = {},
    event = "VeryLazy",
}
