return {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode,
    dependencies = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")
        local compare = require("cmp.config.compare")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        vim.opt.completeopt = "menu,menuone,noselect"

        local function snippet_fun(args)
            luasnip.lsp_expand(args.body)
        end

        local function tab_complete(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end

        local function s_tab_complete(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end

        cmp.setup({
            snippet = { expand = snippet_fun },
            preselect = "None",
            mapping = {
                ["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                ["<tab>"] = cmp.mapping(tab_complete, { "i", "s" }),
                ["<s-tab>"] = cmp.mapping(s_tab_complete, { "i", "s" }),
                ["<cr>"] = cmp.mapping.confirm({ select = false }),
            },
            sources = {
                { name = "nvim_lsp", max_item_count = 30 },
                { name = "conjure" },
                { name = "luasnip", option = { use_show_condition = false } },
                { name = "path" },
                { name = "buffer", keyword_length = 3 },
            },
            formatting = {
                format = lspkind.cmp_format(),
            },
            sorting = {
                comparators = {
                    compare.locality,
                    compare.recently_used,
                    compare.score,
                    compare.offset,
                    compare.order,
                },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                {
                    name = "cmdline",
                    option = { ignore_cmds = { "Man", "!" } },
                },
            }),
            view = {
                entries = { name = "wildmenu", separator = " · " },
            },
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
    end,
}
