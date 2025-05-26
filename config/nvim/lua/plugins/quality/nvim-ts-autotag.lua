---@type LazySpec
return {
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = true,
        dependencies = {
            "nvim-treesitter",
        },
    }
}
