---@module "lazy"
---@type LazySpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        indent = { enabled = true },
        scratch = { enabled = true },
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
            "<leader>.",
            function()
                Snacks.scratch()
            end,
            desc = "Toggle scratch buffer",
        },
        {
            "<leader>s",
            function()
                Snacks.scratch.select()
            end,
            desc = "Select scratch buffer",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>t",
            function()
                Snacks.picker.treesitter()
            end,
            desc = "Treesitter symbols",
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
            "U",
            function()
                Snacks.picker.undo()
            end,
            desc = "Undo history",
        },
        {
            "<leader>D",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
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
    },
}

-- vim.keymap.set("n", "<leader>c", function()
--     builtin.git_files({ cwd = vim.fn.expand("$HOME/.local/share/chezmoi") })
-- end, { desc = "Open chezmoi picker" })
