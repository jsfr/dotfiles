return {
    "echasnovski/mini.starter",
    cond = not vim.g.vscode,
    priority = 999,
    opts = {
        query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
    },
}
