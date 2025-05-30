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
        "echasnovski/mini.misc",
        priority = 990,
        lazy = false,
        config = function()
            local misc = require("mini.misc")
            misc.setup()
            misc.setup_auto_root()
        end,
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

    -- Misc
    {
        "nmac427/guess-indent.nvim",
        opts = {},
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {
            override = {
                css = { icon = "", color = "#663399", cterm_color = "91", name = "Css" },
            },
        },
    },
}, {
    install = { colorscheme = { "tokyonight-storm" } },
    performance = { reset_packpath = true },
    rocks = { enabled = false },
})
