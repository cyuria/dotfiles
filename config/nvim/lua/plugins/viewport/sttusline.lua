---@type LazySpec
return {
    {
        "sontungexpt/sttusline",
        branch = "table_version",
        event = { "BufEnter" },
        opts = {
            statusline_color = "StatusLine",
            laststatus = 3,
            disabled = {
                filetypes = {
                    "lazy",
                    "mason",
                },
                buftypes = {
                    "terminal",
                },
            },
            components = {
                { "mode",        { padding = 2 } },
                "%=",
                { "filename",    { padding = 2 } },
                { "diagnostics", { padding = 2 } },
                "%=",
                { "git-diff",            { padding = 2 } },
                { "git-branch",          { padding = 2 } },
                { "lsps-formatters",     { padding = 2 } },
                { "pos-cursor",          { padding = 2 } },
                { "pos-cursor-progress", { padding = 2 } },
            },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    }
}
