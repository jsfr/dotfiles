local function delete_buffer()
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
    local bufcount = #(vim.api.nvim_list_bufs())
    if bufcount <= 2 or vim.tbl_contains({ "help", "quickfix" }, buftype) then
        vim.api.nvim_buf_delete(0, {})
    else
        require("mini.bufremove").delete(0, false)
    end
end

-- local function delete_buffer_simple()
--     vim.api.nvim_buf_delete(0, {})
-- end

---@module "lazy"
---@type LazySpec
return {
    "echasnovski/mini.bufremove",
    cond = not vim.g.vscode,
    opts = {},
    keys = {
        { "<C-w>", delete_buffer, desc = "Close buffer" },
        -- { "<C-W>", delete_buffer_simple, desc = "Close buffer + window" },
    },
}
