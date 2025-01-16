-- Set leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- spacemacs inspired keybindings
vim.keymap.set("n", "<leader>wc", "<c-w>q", { desc = "Close window" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", { desc = "Horizontal split" })

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
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Open Mason" })

-- VSCode keybindings
if vim.g.vscode then
    local vscode = require("vscode")

    vim.keymap.set("n", "]d", function()
        vscode.call("editor.action.marker.next")
    end)
    vim.keymap.set("n", "[d", function()
        vscode.call("editor.action.marker.prev")
    end)
end
