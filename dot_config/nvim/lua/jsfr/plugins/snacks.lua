---@module "lazy"

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        indent = { enabled = true },
        picker = {
            enabled = true,
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                    },
                },
            },
        },
    },
    keys = {
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>g",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Changed files",
        },
        {
            "<leader>f",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Project files",
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>p",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<leader>o",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent files",
        },
        {
            "<leader>c",
            function()
                Snacks.picker.files({
                    hidden = true,
                    dirs = {
                        vim.fn.expand("$HOME/.local/share/chezmoi"),
                    },
                })
            end,
            desc = "Chezmoi",
        },
        -- Undo
        {
            "U",
            function()
                Snacks.picker.undo()
            end,
            desc = "Undo history",
        },
        -- Buffers
        {
            "<leader>d",
            function()
                Snacks.bufdelete()
            end,
            desc = "Delete buffer",
        },
        -- LSP, lint, and diagnostics
        {
            "<leader>t",
            function()
                Snacks.picker.treesitter()
            end,
            desc = "Treesitter symbols",
        },
        {
            "<leader>x",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Buffer diagnostics",
        },
        {
            "<leader>X",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
    },
}
