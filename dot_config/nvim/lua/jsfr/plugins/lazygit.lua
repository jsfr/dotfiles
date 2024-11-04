return {
    "kdheepak/lazygit.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>g", "<cmd>LazyGit<cr>" } },
    cmd = { "LazyGit" },
}
