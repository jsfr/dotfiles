---@module "lazy"
---@type LazySpec
return {
    "mason-org/mason.nvim",
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
    },
    cmd = { "Mason", "MasonUpdate" },
}
