---@module "lazy"
---@type LazySpec
return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = {
                "select_next",
                "snippet_forward",
                "fallback",
            },
            ["<S-Tab>"] = {
                "select_prev",
                "snippet_backward",
                "fallback",
            },
            ["<CR>"] = {
                "accept",
                "fallback",
            },
        },

        completion = {
            list = {
                selection = {
                    preselect = false,
                },
            },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        sources = {
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },

        cmdline = {
            enabled = true,
            completion = {
                menu = {
                    auto_show = true,
                },
                list = {
                    selection = {
                        preselect = false,
                    },
                },
            },
            keymap = {
                ["<Tab>"] = {
                    "select_next",
                    "fallback",
                },
                ["<S-Tab>"] = {
                    "select_prev",
                    "fallback",
                },
                ["<CR>"] = {
                    function(cmp)
                        return cmp.accept({
                            callback = function()
                                vim.api.nvim_feedkeys(
                                    vim.api.nvim_replace_termcodes("<CR>", true, false, true),
                                    "n",
                                    false
                                )
                            end,
                        })
                    end,
                    "fallback",
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
