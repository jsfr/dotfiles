return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = vim.g.os == "Windows" and "make install_jsregexp CC=gcc.exe SHELL=sh.exe .SHELLFLAGS=-c"
        or "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
