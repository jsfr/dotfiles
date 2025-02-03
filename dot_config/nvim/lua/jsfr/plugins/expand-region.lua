---@module "lazy"
---@type LazySpec
return {
    "terryma/vim-expand-region",
    keys = {
        { "v", "<Plug>(expand_region_expand)", mode = "v" },
        { "<c-v>", "<Plug>(expand_region_shrink)", mode = "v" },
    },
}
