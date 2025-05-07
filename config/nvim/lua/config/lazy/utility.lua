---@type LazySpec
return {
    -- persistence.nvim
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        opts = {
            keymaps = {
                normal = "<leader>ys",
                normal_cur = "<leader>y<leader>",
                normal_line = "<leader>yS",
                normal_line_cur = "<leader>yS<leader>",
                visual = "<leader>S",
                visual_line = "<leader>gS",
                delete = "<leader>ds",
                change = "<leader>cs",
                change_line = "<leader>cS",
            },
        },
        dependencies = {
            "nvim-treesitter",
        }
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        opts = {
            check_ts = true, -- use treesitter
        },
    },
    -- nvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
        config = true,
        dependencies = {
            "nvim-treesitter",
        },
    },
    -- beacon.nvim
    {
        "danilamihailov/beacon.nvim",
        event = "VeryLazy",
        config = true,
    },
    -- nvim-colorizer.lua
    {
        "norcalli/nvim-colorizer.lua",
        main = "colorizer",
        ft = "*",
        opts = { '*' },
    },
    -- todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "plenary.nvim",
        },
    },
    -- undotree
    {
        "mbbill/undotree",
        cmd = {
            "UndotreeToggle",
            "UndotreeHide",
            "UndotreeShow",
            "UndotreeFocus",
            "UndotreePersistUndo",
        },
    },
    -- vim-matchup
    {
        "andymass/vim-matchup",
    },
    -- vim-unimpaired
    {
        "tpope/vim-unimpaired",
    },
    -- AnsiEsc.vim
    {
        "Makaze/AnsiEsc",
    },
    -- build.nvim
    {
        "cyuria/build.nvim",
        dev = true,
        opts = {},
    },
    -- gx.nvim
    {
        "chrishrb/gx.nvim",
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        cmd = { "Browse" },
        init = function () vim.g.netrw_nogx = 1 end,
        dependencies = { "nvim-lua/plenary.nvim" },
        submodules = false,
        opts = { },
    },
}
