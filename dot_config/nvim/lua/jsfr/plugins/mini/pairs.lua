return {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function()
        local mini_pairs = require("mini.pairs")
        local augroup = require("jsfr.utils.augroup")

        mini_pairs.setup({})

        augroup("MiniPairsRustGroup", function(autocmd)
            autocmd("FileType", {
                pattern = "rust",
                callback = function()
                    mini_pairs.map_buf(0, "i", "<", {
                        action = "open",
                        pair = "<>",
                        neigh_pattern = "[:]",
                        register = {
                            cr = false,
                        },
                    })
                    mini_pairs.map_buf(0, "i", ">", {
                        actions = "close",
                        pair = "<>",
                        register = {
                            cr = false,
                        },
                    })
                end,
            })
        end)
    end,
}
