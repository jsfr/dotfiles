---@module "lazy"
---@type LazySpec
return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    enabled = false,
    config = function()
        require("codecompanion").setup({
            log_level = "DEBUG",
            strategies = {
                chat = {
                    adapter = "claude_code",
                },
                -- inline = {
                --     adapter = "copilot",
                -- },
                -- cmd = {
                --     adapter = "deepseek",
                -- },
            },
            adapters = {
                acp = {
                    claude_code = function()
                        return require("codecompanion.adapters").extend("claude_code", {
                            env = {
                                CLAUDE_CODE_OAUTH_TOKEN = "cmd:op read op://Private/claude-code-api-token/password --no-newline",
                            },
                        })
                    end,
                },
            },
        })
    end,
}
