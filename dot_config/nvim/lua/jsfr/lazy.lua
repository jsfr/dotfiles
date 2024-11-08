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
        cond = not vim.g.vscode,
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({})
            vim.cmd("colorscheme tokyonight")
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        cond = not vim.g.vscode,
        priority = 999,
        lazy = false,
        main = "project_nvim",
        opts = { "detection_methods", { "pattern" } },
    },

    -- Syntax plugins
    {
        "NoahTheDuke/vim-just",
        cond = not vim.g.vscode,
        ft = "just",
    },
    {
        "tridactyl/vim-tridactyl",
        cond = not vim.g.vscode,
        ft = "tridactyl",
    },
    {
        "ngynkvn/gotmpl.nvim",
        cond = not vim.g.vscode,
        opts = {},
    },

    -- LSP
    {
        "mrcjkb/rustaceanvim",
        cond = not vim.g.vscode,
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        version = "^5",
        ft = { "rust" },
    },

    -- Search and Replace
    {
        "bronson/vim-visual-star-search",
        event = "VeryLazy",
    },

    -- Git
    {
        "linrongbin16/gitlinker.nvim",
        cond = not vim.g.vscode,
        opts = {},
        cmd = { "GitLink" },
    },

    -- Misc
    {
        "MagicDuck/grug-far.nvim",
        cmd = { "GrugFar" },
        opts = {},
    },
    {
        "nmac427/guess-indent.nvim",
        cond = not vim.g.vscode,
        opts = {},
    },
    {
        "anuvyklack/pretty-fold.nvim",
        cond = not vim.g.vscode and not vim.opt.diff:get(),
        opts = {},
        event = "VeryLazy",
    },
    {
        "stevearc/dressing.nvim",
        cond = not vim.g.vscode,
        opts = {},
        event = "VeryLazy",
    },
}, {
    install = { colorscheme = { "tokyonight-storm" } },
    performance = { reset_packpath = true },
})
