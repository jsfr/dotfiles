---@module "lazy"
---@type LazySpec
return {
    "folke/todo-comments.nvim",
    cond = not vim.g.vscode,
    dependencies = {
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    cmd = { "TodoTrouble" },
}
