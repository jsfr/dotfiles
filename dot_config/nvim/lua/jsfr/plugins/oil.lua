---@module "lazy"
---@type LazySpec
return {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } },

    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = { view_options = { show_hidden = true } },
}
