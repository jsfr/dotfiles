local function delete_buffer()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    local bufcount = #(vim.api.nvim_list_bufs())
    if bufcount <= 2 or vim.tbl_contains({ "help", "quickfix" }, buftype) then
        vim.api.nvim_buf_delete(0, {})
    else
        require("mini.bufremove").delete(0, false)
    end
end

local function delete_buffer_simple()
    vim.api.nvim_buf_delete(0, {})
end

return {
    "echasnovski/mini.bufremove",
    cond = not vim.g.vscode,
    opts = {},
    keys = {
        { "<leader>x", delete_buffer },
        { "<leader>X", delete_buffer_simple },
    },
}
