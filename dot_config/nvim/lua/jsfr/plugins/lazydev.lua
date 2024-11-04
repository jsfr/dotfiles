return {
    "folke/lazydev.nvim",
    cond = not vim.g.vscode,
    ft = "lua",
    dependencies = { "Bilal2453/luvit-meta" },
    opts = {
        library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
    },
}
