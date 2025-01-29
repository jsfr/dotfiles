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

        local function on_attach(client, bufnr)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set(
                "n",
                "<leader>k",
                vim.lsp.buf.hover,
                { noremap = true, silent = true, buffer = bufnr, desc = "Show docs under cursor" }
            )
            vim.keymap.set(
                "n",
                "<leader>r",
                vim.lsp.buf.rename,
                { noremap = true, silent = true, buffer = bufnr, desc = "Rename symbol" }
            )
            vim.keymap.set(
                "n",
                "<leader>a",
                vim.lsp.buf.code_action,
                { noremap = true, silent = true, buffer = bufnr, desc = "Perform code action" }
            )
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, buffer = bufnr })

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end

        local servers = {
            bashls = {},
            docker_compose_language_service = {},
            dockerls = {},
            eslint = {},
            golangci_lint_ls = {},
            gopls = {
                settings = {
                    gopls = {
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            },
            html = {},
            jsonls = { settings = { json = { schemas = schemastore.json.schemas(), validate = { enable = true } } } },
            lua_ls = { setting = { Lua = { hint = { enable = true } } } },
            marksman = {},
            omnisharp = {
                settings = {
                    RoslynExtensionsOptions = {
                        InlayHintsOptions = {
                            EnableForParameters = true,
                            ForLiteralParameters = true,
                            ForIndexerParameters = true,
                            ForObjectCreationParameters = true,
                            ForOtherParameters = true,
                            SuppressForParametersThatDifferOnlyBySuffix = false,
                            SuppressForParametersThatMatchMethodIntent = false,
                            SuppressForParametersThatMatchArgumentName = false,
                            EnableForTypes = true,
                            ForImplicitVariableTypes = true,
                            ForLambdaParameterTypes = true,
                            ForImplicitObjectCreatio = true,
                        },
                    },
                },
            },
            ruff = {},
            rust_analyzer = { disabled = true },
            taplo = {},
            terraformls = {},
            tflint = {},
            ts_ls = { disabled = true },
            typos_lsp = {},
            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = { enable = false, url = "" },
                    },
                    schemas = schemastore.yaml.schemas(),
                },
            },
            zls = {
                enable_inlay_hints = true,
                inlay_hints_show_builtin = true,
                inlay_hints_exclude_single_argument = true,
                inlay_hints_hide_redundant_param_names = false,
                inlay_hints_hide_redundant_param_names_last_token = false,
            },
            pylyzer = {
                settings = {
                    python = {
                        inlayHints = true,
                    },
                },
            },
            kotlin_language_server = {
                settings = {
                    kotlin = {
                        hints = {
                            typeHints = true,
                            parameterHints = true,
                            chaineHints = true,
                        },
                    },
                },
            },
        }

        if vim.env.WSL_DISTRO_NAME == "NixOS" then
            servers["nil_ls"] = {}
        end

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

        local configs = require("lspconfig.configs")
        if not configs.nushell_lsp then
            configs.nushell_lsp = {
                default_config = {
                    cmd = { "nu", "--lsp" },
                    root_dir = lspconfig.util.root_pattern(".git"),
                    filetypes = { "nu" },
                    on_attach = on_attach,
                },
            }
        end
        lspconfig.nushell_lsp.setup({})

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true,
        })
        mason_lspconfig.setup_handlers({ setup_server })
    end,
}
