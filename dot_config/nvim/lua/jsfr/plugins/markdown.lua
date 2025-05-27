---@module "lazy"
---@type LazySpec
return {
    {
        "folke/zen-mode.nvim",
        opts = {},
    },
    {
        "folke/twilight.nvim",
        opts = {},
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            completions = { blink = { enabled = true } },
        },
    },
}
