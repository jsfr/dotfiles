-- Set leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- jj escape sequence
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "JJ", "<esc>")
vim.keymap.set("c", "jj", "<c-c>")
vim.keymap.set("c", "JJ", "<c-c>")

-- spacemacs inspired keybindings
vim.keymap.set("n", "<leader>wc", "<c-w>q")
vim.keymap.set("n", "<leader>wc/", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>w-", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>w_", "<c-w>_")

-- visual shifting (does not exit visual mode)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- treat long lines as break lines (useful when moving around in them)
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- tab to go to last active buffer
local function mru_buffer()
    local prev_buf = vim.fn.bufnr("#")
    local buf_exists = vim.fn.buflisted(prev_buf)
    if buf_exists == 1 then
        vim.cmd("b #")
    else
        vim.cmd("bprev")
    end
end
vim.keymap.set("n", "<tab>", mru_buffer)

-- open lazy and mason
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>")

-- VSCode keybindings
if not vim.g.vscode then
    return
end

local vscode = require("vscode")

vim.keymap.set("n", "]d", function()
    vscode.call("editor.action.marker.next")
end)
vim.keymap.set("n", "[d", function()
    vscode.call("editor.action.marker.prev")
end)
