---@module "lazy"
---@type LazySpec
return {
    "williamboman/mason.nvim",
    cond = not vim.g.vscode,
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:crashdummyy/mason-registry",
        },
    },
    cmd = { "Mason", "MasonUpdate" },
}
