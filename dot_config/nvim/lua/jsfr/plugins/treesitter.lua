return {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    main = "nvim-treesitter.configs",
    dependencies = { "windwp/nvim-ts-autotag" },
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    },
}
