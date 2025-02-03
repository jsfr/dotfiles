---@module "lazy"
---@type LazySpec
return {
    "mrjones2014/smart-splits.nvim",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        local ss = require("smart-splits")

        -- resizing splits
        vim.keymap.set("n", "<C-S-H>", ss.resize_left)
        vim.keymap.set("n", "<C-S-J>", ss.resize_down)
        vim.keymap.set("n", "<C-S-K>", ss.resize_up)
        vim.keymap.set("n", "<C-S-L>", ss.resize_right)

        -- moving between splits
        vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
        vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
        vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
        vim.keymap.set("n", "<C-l>", ss.move_cursor_right)

        ss.setup({
            ignored_buftypes = { "NvimTree", "undotree" },
        })
    end,
}
