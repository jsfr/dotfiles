---@module "lazy"
---@type LazySpec
return {
    {
        "Pocco81/true-zen.nvim",
        opts = {},
    },
    -- {
    --     "MeanderingProgrammer/render-markdown.nvim",
    --     dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    --     ---@module 'render-markdown'
    --     ---@type render.md.UserConfig
    --     opts = {
    --         completions = { blink = { enabled = true } },
    --     },
    -- },
    {
        "OXY2DEV/markview.nvim",
        opts = {},
        ft = { "markdown" },
    },
}
