return {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({})

        vim.keymap.set("n", "]c", gitsigns.next_hunk)
        vim.keymap.set("n", "[c", gitsigns.prev_hunk)

        vim.cmd("cnoreabbrev <expr> gs (getcmdtype() == ':') ? 'Gitsigns' : 'gs'")
    end,
}
