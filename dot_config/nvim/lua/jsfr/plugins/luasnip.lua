return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = vim.loop.os_uname().sysname == "Windows_NT"
            and "make install_jsregexp CC=gcc.exe SHELL=sh.exe .SHELLFLAGS=-c"
        or "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
