---@module "lazy"
---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    dependencies = { "windwp/nvim-ts-autotag", "nushell/tree-sitter-nu" },
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        ensure_installed = { "nu" },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    },
}
