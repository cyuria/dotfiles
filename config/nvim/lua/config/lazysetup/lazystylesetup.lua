return {
    -- feline.nvim
    {
        "freddiehaddad/feline.nvim",
        lazy = false,
        opts = function() return require'config.felinesetup' end,
        config = function(_, opts)
            local feline = require'feline'
            feline.setup(opts)
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "gitsigns.nvim",
            "tokyonight.nvim",
        },
    },
    -- tabby.nvim
    {
        "nanozuki/tabby.nvim",
        lazy = false,
    },
}
