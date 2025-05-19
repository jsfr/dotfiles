---@module "lazy"
---@type LazySpec
return {
    {
        "linrongbin16/lsp-progress.nvim",
        opts = {},
        lazy = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "mfussenegger/nvim-lint", "linrongbin16/lsp-progress.nvim" },
        config = function()
            local lualine = require("lualine")

            local function lint_progress()
                local linters = require("lint").get_running()
                if #linters == 0 then
                    return "󱉶 " .. table.concat(linters(", "))
                end
            end

            local function lsp_progress()
                return require("lsp-progress").progress()
            end

            lualine.setup({
                options = { theme = "tokyonight" },
                sections = {
                    lualine_b = { "branch", "diff", "diagnostics", lint_progress },
                    lualine_c = { lsp_progress },
                },
            })

            -- listen lsp-progress event and refresh lualine
            vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
            vim.api.nvim_create_autocmd("User", {
                group = "lualine_augroup",
                pattern = "LspProgressStatusUpdated",
                callback = lualine.refresh,
            })
        end,
    },
}
