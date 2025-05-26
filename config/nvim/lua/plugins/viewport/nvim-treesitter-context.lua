---@type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "filetype",
        opts = {},
        dependencies = {
            "nvim-treesitter",
        },
    }
}
