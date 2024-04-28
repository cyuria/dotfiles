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
    -- pretty-fold.nvim
    {
        "anuvyklack/pretty-fold.nvim",
        lazy = false,
        opts = {
            sections = {
                left = {
                    function()
                        return vim.fn.getline(vim.v.foldstart)
                    end,
                    ' 󰝢  ', 'number_of_folded_lines', '  '
                },
                right = {
                    '  ', 'percentage', ' |- '
                },
            },
            fill_char = '󰇜',
        },
    },
}
