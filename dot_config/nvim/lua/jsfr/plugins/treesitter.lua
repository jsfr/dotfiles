return {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    main = "nvim-treesitter.configs",
    dependencies = { "windwp/nvim-ts-autotag" },
    build = function()
        vim.cmd("TSUpdate")
    end,
    opts = {
        ensure_installed = "all",
        ignore_install = { "phpdoc", "smali", "t32" },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    },
}
