return {
    "williamboman/mason-lspconfig.nvim",
    cond = not vim.g.vscode,
    dependencies = {
        "b0o/schemastore.nvim",
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local schemastore = require("schemastore")

        local function on_attach(_, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, bufopts)
        end

        local servers = {
            bashls = {},
            golangci_lint_ls = {},
            gopls = {},
            jsonls = { settings = { json = { schemas = schemastore.json.schemas, validate = { enable = true } } } },
            taplo = {},
            rust_analyzer = { disabled = true },
            terraformls = {},
            tflint = {},
            eslint = {},
            ts_ls = { disabled = true },
            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
                    },
                },
            },
            lua_ls = {
                -- settings = { Lua = { workspace = { library = { ["/Users/jens/.hammerspoon/Spoons/EmmyLua.spoon/annotations"] = true } } } }
            },
            typos_lsp = {},
            ruff_lsp = {},
            marksman = {},
            dockerls = {},
            html = {},
            docker_compose_language_service = {},
            omnisharp_mono = {},
        }

        local function get_server_config(server_name)
            local config = servers[server_name]
            if config == nil then
                print("Failed to find config for " .. server_name)
                config = {}
            else
                config.on_attach = on_attach
            end
            return config
        end

        local function get_server_setup_fun(server_name)
            local server = lspconfig[server_name]
            return server.setup
        end

        local function setup_server(server_name)
            local config = get_server_config(server_name)
            local setup_fun = get_server_setup_fun(server_name)
            if not config.disabled then
                setup_fun(config)
            end
        end

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true,
        })
        mason_lspconfig.setup_handlers({ setup_server })
    end,
}
