---@module "lazy"
---@type LazySpec
return {
    "mrcjkb/rustaceanvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    version = "^6",
    lazy = false,
    ft = { "rust" },
}
