local function lint_progress()
    local linters = require("lint").get_running()
    if #linters == 0 then
        return "󱉶 " .. table.concat(linters(", "))
    end
end

return {
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-tree/nvim-web-devicons", "mfussenegger/nvim-lint" },
    opts = {
        options = { theme = "tokyonight" },
        sections = { lualine_b = { "branch", "diff", "diagnostics", lint_progress } },
    },
}
