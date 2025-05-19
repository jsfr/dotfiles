---@module "lazy"
---@type LazySpec
return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
        { "U", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
