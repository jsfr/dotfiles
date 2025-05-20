---@module "lazy"
---@type LazySpec
return {
    "nvim-telescope/telescope.nvim",
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
                        ["<c-o>"] = trouble.open,
                        ["<esc>"] = actions.close,
                    },
                    n = {
                        ["<c-o>"] = trouble.open,
                    },
                },
            },
        })

        -- Extensions
        telescope.load_extension("fzy_native")

        -- Keybindings
        vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>t", builtin.treesitter, { desc = "Open treesitter symbol picker" })
        vim.keymap.set("n", "<leader>g", builtin.git_status, { desc = "Open changed file picker" })
        vim.keymap.set("n", "<leader>f", builtin.git_files, { desc = "Open file picker" })
        vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Open buffer picker" })
        vim.keymap.set("n", "<leader>o", builtin.oldfiles, { desc = "Open oldfiles picker" })
        vim.keymap.set("n", "<leader>c", function()
            builtin.git_files({ cwd = vim.fn.expand("$HOME/.local/share/chezmoi") })
        end, { desc = "Open chezmoi picker" })
    end,
}
