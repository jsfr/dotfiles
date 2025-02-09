---@module "lazy"
---@type LazySpec
return {
    "linrongbin16/gitlinker.nvim",
    cond = not vim.g.vscode,
    cmd = { "GitLink" },

    ---@module 'gitlinker'
    ---@type gitlinker.Options
    opts = {
        router = {
            browse = {
                ["^ssh.dev.azure%.com"] = "https://dev.azure.com"
                    .. "/{_A.ORG:gsub('v3/', '')}"
                    .. "/_git"
                    .. "/{_A.REPO}"
                    .. "?path={_A.FILE}"
                    .. "&version=GB{_A.CURRENT_BRANCH}"
                    .. "&line={_A.LSTART}"
                    .. "&lineEnd={_A.LEND == _A.LSTART and _A.LEND + 1 or _A.LEND }"
                    .. "&lineStartColumn=1"
                    .. "&lineEndColumn=1"
                    .. "&lineStyle=plain"
                    .. "&_a=contents",
            },
            blame = {
                ["^ssh.dev.azure%.com"] = "",
            },
            current_branch = {
                ["^ssh.dev.azure%.com"] = "https://dev.azure.com"
                    .. "/{_A.ORG:gsub('v3/', '')}"
                    .. "/_git"
                    .. "/{_A.REPO}"
                    .. "?path={_A.FILE}"
                    .. "&version=GB{_A.CURRENT_BRANCH}"
                    .. "&line={_A.LSTART}"
                    .. "&lineEnd={_A.LEND == _A.LSTART and _A.LEND + 1 or _A.LEND }"
                    .. "&lineStartColumn=1"
                    .. "&lineEndColumn=1"
                    .. "&lineStyle=plain"
                    .. "&_a=contents",
            },
            default_branch = {
                ["^ssh.dev.azure%.com"] = "https://dev.azure.com"
                    .. "/{_A.ORG:gsub('v3/', '')}"
                    .. "/_git"
                    .. "/{_A.REPO}"
                    .. "?path={_A.FILE}"
                    .. "&version=GB{_A.DEFAULT_BRANCH}"
                    .. "&line={_A.LSTART}"
                    .. "&lineEnd={_A.LEND == _A.LSTART and _A.LEND + 1 or _A.LEND }"
                    .. "&lineStartColumn=1"
                    .. "&lineEndColumn=1"
                    .. "&lineStyle=plain"
                    .. "&_a=contents",
            },
        },
    },
}

--https://dev.azure.com/cur8/TheRigg/_git/APIBackend?path=/.git-blame-ignore-revs&version=GBmaster&line=8&lineEnd=8&lineStartColumn=1&lineEndColumn=41&lineStyle=plain&_a=contents
