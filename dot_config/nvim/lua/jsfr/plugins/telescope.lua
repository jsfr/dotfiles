return {
    "nvim-telescope/telescope.nvim",
    cond = not vim.g.vscode,
    dependencies = {
        "folke/trouble.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
    },
    branch = "0.1.x",
    event = "VeryLazy",
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local trouble = require("trouble.sources.telescope")
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<c-t>"] = trouble.open,
                        ["<esc>"] = actions.close,
                    },
                    n = {
                        ["<c-t>"] = trouble.open,
                    },
                },
            },
        })

        -- Extensions
        telescope.load_extension("fzy_native")
        telescope.load_extension("chezmoi")

        -- Keybindings
        vim.keymap.set("n", "<leader>rg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fa", function()
            builtin.find_files({ hidden = true })
        end)
        vim.keymap.set("n", "<leader>ft", builtin.treesitter)
        vim.keymap.set("n", "<leader>fg", builtin.git_status)
        vim.keymap.set("n", "<leader>ff", builtin.git_files)
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>fr", builtin.registers)
        vim.keymap.set("n", "<leader>.", telescope.extensions.chezmoi.find_files)
    end,
}
