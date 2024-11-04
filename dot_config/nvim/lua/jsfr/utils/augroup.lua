--- Creates an autocmd group that will automatically group and clear the
--- autocmds created within it.
--- @param name string
--- @param func fun(autocmd: fun(event: any, opts: vim.api.keyset.create_autocmd))
local function augroup(name, func)
    local group = vim.api.nvim_create_augroup(name, {})

    --- @param event any
    --- @param opts vim.api.keyset.create_autocmd
    local function autocmd(event, opts)
        vim.api.nvim_create_autocmd(event, vim.tbl_extend("force", opts, { group = group }))
    end

    func(autocmd)
end

return augroup
