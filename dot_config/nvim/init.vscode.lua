vim.loader.enable()

require("jsfr.core")

local vscode = require("vscode")

vim.keymap.set("n", "-", function()
    vscode.action("workbench.files.action.showActiveFileInExplorer")
end)

vim.keymap.set("n", "<leader>a", function()
    vscode.action("editor.action.quickFix")
end)

vim.keymap.set("n", "<leader>rn", function()
    vscode.action("editor.action.rename")
end)
