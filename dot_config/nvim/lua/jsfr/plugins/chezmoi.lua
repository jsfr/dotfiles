return {
    "xvzc/chezmoi.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local chezmoi = require("chezmoi")

        chezmoi.setup({})

        -- local augroup = require("jsfr.utils.augroup")
        -- augroup("ChezmoiGroup", function(autocmd)
        --     autocmd({ "BufRead", "BufNewFile" }, {
        --         pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        --         callback = function(ev)
        --             local bufnr = ev.buf
        --             local edit_watch = function()
        --                 require("chezmoi.commands.__edit").watch(bufnr)
        --             end
        --             vim.schedule(edit_watch)
        --         end,
        --     })
        -- end)
    end,
}
