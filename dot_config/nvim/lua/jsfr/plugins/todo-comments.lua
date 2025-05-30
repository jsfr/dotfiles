---@module "lazy"
---@type LazySpec
return {
    "folke/todo-comments.nvim",
    opts = {},
    event = "VeryLazy",
    keys = {
        {
            "<leader>T",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "Todo",
        },
    },
}
