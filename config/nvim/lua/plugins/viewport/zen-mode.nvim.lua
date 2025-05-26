---@type LazySpec
return {
    {
        "folke/zen-mode.nvim",
        opts = {},
        cmd = "ZenMode",
        keys = {
            { '<leader>z', vim.cmd.ZenMode, desc = 'Toggle Zen Mode' },
        },
        dependencies = {
            "twilight.nvim",
        },
    }
}
