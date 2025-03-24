---@module "lazy"
---@type LazySpec
return {
    "folke/trouble.nvim",
    cond = not vim.g.vscode,
    opts = {},
    cmd = "Trouble",
    keys = {
        -- {
        --     "<leader>D",
        --     "<cmd>Trouble diagnostics toggle<cr>",
        --     desc = "Open/Close workspace diagnostics",
        -- },
        {
            "<leader>D",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Open/Close buffer diagnostics",
        },
        -- {
        --     "<leader>cs",
        --     "<cmd>Trouble symbols toggle focus=false<cr>",
        --     desc = "Symbols (Trouble)",
        -- },
        -- {
        --     "<leader>cl",
        --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        --     desc = "LSP Definitions / references / ... (Trouble)",
        -- },
        {
            "<leader>l",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Open location list",
        },
        {
            "<leader>q",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Open quickfix list",
        },
    },
}
