---@module "lazy"
---@type LazySpec
return {
    "max397574/better-escape.nvim",
    main = "better_escape",
    enabled = false,
    opts = {
        default_mappings = false,
        mappings = {
            i = {
                j = {
                    j = "<Esc>",
                },
            },
            c = {
                j = {
                    j = "<Esc>",
                },
            },
        },
    },
}
