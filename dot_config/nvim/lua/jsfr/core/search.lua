local augroup = require("jsfr.utils.augroup")

augroup("BetterSearchGroup", function(autocmd)
    autocmd("ColorScheme", {
        callback = function()
            local search = vim.api.nvim_get_hl(0, { name = "Search" })
            vim.api.nvim_set_hl(0, "CurSearch", { link = "IncSearch" })
            vim.api.nvim_set_hl(0, "SearchCurrentN", search)
            vim.api.nvim_set_hl(0, "Search", { link = "SearchCurrentN" })
        end,
    })
    autocmd("CmdlineEnter", {
        pattern = "/,\\?",
        callback = function()
            -- When searching via :/, enable all search highlights
            vim.opt.hlsearch = true
            vim.opt.incsearch = true
            vim.api.nvim_set_hl(0, "Search", { link = "SearchCurrentN" })
        end,
    })
    autocmd("CmdlineLeave", {
        pattern = "/,\\?",
        callback = function()
            -- When leaving after :/, clear Search highlights (NOT CurSearch).
            -- May have side effects if plugins link to Search
            vim.api.nvim_set_hl(0, "Search", {})
            -- turn on hlsearch after the cursor move runs nohlsearch
            -- Could also use a shared guard flag variable
            vim.defer_fn(function()
                vim.opt.hlsearch = true
            end, 5)
        end,
    })
    autocmd({ "InsertEnter", "CursorMoved" }, {
        callback = function()
            -- Must run :nohlsearch outside of autocmd, see :h autocmd-searchpat
            vim.schedule(function()
                vim.cmd("nohlsearch")
            end)
        end,
    })
end)

local function other(k)
    if k == "n" then
        return "N"
    elseif k == "N" then
        return "n"
    end
end
local function feed(k)
    vim.api.nvim_feedkeys(k, "n", true)
end
local function handle_n_N(key)
    return function()
        if vim.v.searchforward == 0 then
            feed(other(key))
        elseif vim.v.searchforward == 1 then
            feed(key)
        end

        -- Wait a moment, so the cursor moves, the CursorMoved autocmd triggers, then
        -- we flip hlsearch back on.
        -- You may prefer to use a flag var instead of defer_fn.
        vim.defer_fn(function()
            vim.opt.hlsearch = true
        end, 5)
    end
end

vim.keymap.set("n", "n", handle_n_N("n"))
vim.keymap.set("n", "N", handle_n_N("N"))
