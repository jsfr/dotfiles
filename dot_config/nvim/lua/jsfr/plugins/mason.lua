---@module "lazy"
---@type LazySpec
return {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    cond = not vim.g.vscode,
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:crashdummyy/mason-registry",
        },
    },
    cmd = { "Mason", "MasonUpdate" },
}
