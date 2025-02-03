---@module "lazy"
---@type LazySpec
return {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({})

        vim.keymap.set("n", "]c", function()
            gitsigns.nav_hunk("next")
        end)
        vim.keymap.set("n", "[c", function()
            gitsigns.nav_hunk("prev")
        end)

        vim.cmd("cnoreabbrev <expr> gs (getcmdtype() == ':') ? 'Gitsigns' : 'gs'")
    end,
}
