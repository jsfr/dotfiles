---@module "lazy"
---@type LazySpec
return {
    "folke/ts-comments.nvim",
    opts = {
        lang = {
            nu = "# %s",
            autohotkey = "; %s",
            fish = "# %s",
            just = "# %s",
            janet = "# %s",
        },
    },
    event = "VeryLazy",
}
