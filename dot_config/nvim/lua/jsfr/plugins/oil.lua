return {
    "stevearc/oil.nvim",
    cond = not vim.g.vscode,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = { view_options = { show_hidden = true } },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } },
}
