---@module "lazy"
---@type LazySpec
return {
    "jiaoshijie/undotree",
    cond = not vim.g.vscode,
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
        { "U", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
