return {
    "rshkarin/mason-nvim-lint",
    cond = not vim.g.vscode,
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-lint",
    },
    opts = {
        ensure_installed = {
            "hadolint",
            "actionlint",
            "htmlhint",
        },
        automatic_installation = false,
    },
}
