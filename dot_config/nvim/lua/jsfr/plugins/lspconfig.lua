---@module "lazy"
---@type LazySpec
return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
        "b0o/schemastore.nvim",
        "MysticalDevil/inlay-hints.nvim",
    },
    config = function()
        local ensure_installed = {
            "basedpyright",
            "bashls",
            "bicep",
            "cssls",
            "denols",
            "dockerls",
            "eslint",
            "golangci_lint_ls",
            "gopls",
            "html",
            "jsonls",
            "kotlin_language_server",
            "ltex_plus",
            "lua_ls",
            "marksman",
            "nim_langserver",
            "powershell_es",
            "rust_analyzer",
            "taplo",
            "terraformls",
            "tflint",
            "typos_lsp",
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

        vim.lsp.config.basedpyright = {
            settings = {
                basedpyright = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true,
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

        local augroup = require("jsfr.utils.augroup")
        augroup("OnLspAttach", function(autocmd)
            autocmd("LspAttach", {
                pattern = "*",
                callback = function(args)
                    local bufnr = args.buf

                    vim.keymap.set(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration,
                        { noremap = true, silent = true, buffer = bufnr }
                    )
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
                    vim.keymap.set(
                        "n",
                        "gi",
                        vim.lsp.buf.implementation,
                        { noremap = true, silent = true, buffer = bufnr }
                    )
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, buffer = bufnr })
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
                        { noremap = true, silent = true, buffer = bufnr, desc = "Code action" }
                    )
                    vim.keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = 1, float = true })
                    end, { noremap = true, silent = true, buffer = bufnr })
                    vim.keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = -1, float = true })
                    end, { noremap = true, silent = true, buffer = bufnr })

                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end
                end,
            })
        end)
    end,
}
