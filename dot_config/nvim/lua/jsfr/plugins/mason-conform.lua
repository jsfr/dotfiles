return {
    "LittleEndianRoot/mason-conform",
    cond = not vim.g.vscode,
    dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
    opts = {
        ensure_installed = { "stylua", "shfmt" },
        automatic_installation = false,
        quiet_mode = false,
    },
}
