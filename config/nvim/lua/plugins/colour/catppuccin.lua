---@type LazySpec
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        opts = {
            integrations = {
                alpha = true,
                beacon = true,
                cmp = true,
                gitsigns = true,
                notify = true,
                markdown = true,
                mason = true,
                noice = true,
                treesitter = true,
            }
        },
    },
}
