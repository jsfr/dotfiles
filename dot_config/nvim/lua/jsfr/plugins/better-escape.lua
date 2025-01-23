return {
    "max397574/better-escape.nvim",
    main = "better_escape",
    cond = not vim.g.vscode,
    opts = {
        default_mappings = false,
        mappings = {
            i = {
                j = {
                    j = "<Esc>",
                },
            },
            c = {
                j = {
                    j = "<Esc>",
                },
            },
        },
    },
}
