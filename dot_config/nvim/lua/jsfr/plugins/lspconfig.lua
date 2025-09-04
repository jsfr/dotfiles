---@module "lazy"
---@type LazySpec
return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
        "b0o/schemastore.nvim",
        "MysticalDevil/inlay-hints.nvim",
        "folke/snacks.nvim",
    },
    config = function()
        local ensure_installed = {
            "bashls",
            "bicep",
            "codebook",
            "cssls",
            "denols",
            "dockerls",
            "eslint",
            "golangci_lint_ls",
            "gopls",
            "harper_ls",
            "html",
            "jsonls",
            "kotlin_language_server",
            "lua_ls",
            "marksman",
            "nim_langserver",
            "powershell_es",
            "pyrefly",
            "rust_analyzer",
            "taplo",
            "terraformls",
            "tflint",
            "typos_lsp",
            "vale_ls",
            "vtsls",
            "yamlls",
            "zls",
        }

        if vim.env.WSL_DISTRO_NAME == "NixOS" then
            table.insert(ensure_installed, "nil_ls")
        end

        vim.lsp.config.vtsls = {
            root_markers = { "package.json" },
            workspace_required = true,
            settings = {
                typescript = {
                    inlayHints = {
                        parameterNames = { enabled = "all" },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        enumMemberValues = { enabled = true },
                    },
                },
            },
        }

        vim.lsp.config.denols = {
            root_markers = { "deno.json" },
            workspace_required = true,
            settings = {
                deno = {
                    inlayHints = {
                        parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enable = true },
                        enumMemberValues = { enabled = true },
                    },
                },
            },
        }

        vim.lsp.config.gopls = {
            settings = {
                gopls = {
                    hints = {
                        rangeVariableTypes = true,
                        parameterNames = true,
                        constantValues = true,
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        functionTypeParameters = true,
                    },
                },
            },
        }

        vim.lsp.config.jsonls = {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        }

        vim.lsp.config.yamlls = {
            settings = {
                yaml = {
                    schemaStore = {
                        -- You must disable built-in schemaStore support if you want to use
                        -- this plugin and its advanced options like `ignore`.
                        enable = false,
                        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        }

        vim.lsp.config.lua_ls = {
            settings = {
                Lua = {
                    hint = {
                        enable = true,
                    },
                },
            },
        }

        vim.lsp.config.kotlin_language_server = {
            settings = {
                kotlin = {
                    hints = {
                        typeHints = true,
                        parameterHints = true,
                        chaineHints = true,
                    },
                },
            },
        }

        vim.lsp.config.zls = {
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    inlay_hints_show_builtin = true,
                    inlay_hints_exclude_single_argument = true,
                    inlay_hints_hide_redundant_param_names = false,
                    inlay_hints_hide_redundant_param_names_last_token = false,
                },
            },
        }

        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_enable = {
                exclude = {
                    "rust_analyzer",
                },
            },
        })

        require("inlay-hints").setup()

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("LspAttachGroup", {}),
            callback = function(args)
                vim.keymap.set(
                    "n",
                    "<leader>a",
                    vim.lsp.buf.code_action,
                    { noremap = true, silent = true, buffer = args.buf, desc = "Code action" }
                )

                vim.keymap.set(
                    "n",
                    "<leader>rn",
                    vim.lsp.buf.rename,
                    { noremap = true, silent = true, buffer = args.buf, desc = "Rename symbol" }
                )

                vim.keymap.set("n", "gd", function()
                    Snacks.picker.lsp_definitions()
                end, { noremap = true, silent = true, buffer = args.buf, desc = "Goto Definition" })

                vim.keymap.set("n", "gr", function()
                    Snacks.picker.lsp_references()
                end, { noremap = true, silent = true, buffer = args.buf, desc = "References" })

                vim.keymap.set("n", "gi", function()
                    Snacks.picker.lsp_implementations()
                end, { noremap = true, silent = true, buffer = args.buf, desc = "Goto Implementation" })

                vim.keymap.set("n", "gy", function()
                    Snacks.picker.lsp_type_definitions()
                end, {
                    noremap = true,
                    silent = true,
                    buffer = args.buf,
                    desc = "Goto T[y]pe Definition",
                })

                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end
            end,
        })
    end,
}
