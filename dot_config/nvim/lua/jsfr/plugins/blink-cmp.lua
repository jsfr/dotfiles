return {
    "saghen/blink.cmp",
    cond = not vim.g.vscode,
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = {
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_next()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_forward()
                    else
                        return false
                    end
                end,
                "fallback",
            },
            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_prev()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_backward()
                    else
                        return false
                    end
                end,
                "fallback",
            },
            ["<CR>"] = {
                "accept",
                "fallback",
            },

            cmdline = {
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.select_next()
                        else
                            return false
                        end
                    end,
                    "fallback",
                },
                ["<S-Tab>"] = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.select_prev()
                        else
                            return false
                        end
                    end,
                    "fallback",
                },
                ["<CR>"] = {
                    function(cmp)
                        cmp.accept()
                    end,
                    "fallback",
                },
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
    },
    opts_extend = { "sources.default" },
}
