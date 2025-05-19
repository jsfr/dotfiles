-- Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print("Bootstrapping lazy.nvim")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "jsfr.plugins" },
    { import = "jsfr.plugins.mini" },

    -- During startup
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({})
            vim.cmd("colorscheme tokyonight")
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        priority = 990,
        lazy = false,
        main = "project_nvim",
        opts = { "detection_methods", { "pattern" } },
    },
    {
        "mong8se/actually.nvim",
        dependencies = { "stevearc/dressing.nvim" },
        priority = 980,
        lazy = false,
    },

    -- Syntax plugins
    {
        "NoahTheDuke/vim-just",
        ft = "just",
    },
    {
        "tridactyl/vim-tridactyl",
        ft = "tridactyl",
    },
    {
        "ngynkvn/gotmpl.nvim",
        opts = {},
    },

    -- LSP
    {
        "mrcjkb/rustaceanvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        version = "^6",
        lazy = false,
        ft = { "rust" },
    },

    -- Search and Replace
    {
        "nvimdev/hlsearch.nvim",
        opts = {},
        event = "BufRead",
    },

    -- Misc
    --
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "MagicDuck/grug-far.nvim",
        cmd = { "GrugFar" },
        opts = {},
    },
    {
        "nmac427/guess-indent.nvim",
        opts = {},
    },
    {
        "folke/ts-comments.nvim",
        opts = {
            lang = {
                nu = "# %s",
            },
        },
        event = "VeryLazy",
    },
}, {
    install = { colorscheme = { "tokyonight-storm" } },
    performance = { reset_packpath = true },
})
