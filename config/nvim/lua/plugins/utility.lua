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
        keys = {
            "<leader>ys",
            "<leader>y<leader>",
            "<leader>yS",
            "<leader>yS<leader>",
            "<leader>S",
            "<leader>gS",
            "<leader>ds",
            "<leader>cs",
            "<leader>cS",
        },
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
        event = "InsertEnter",
        opts = {
            check_ts = true, -- use treesitter
        },
    },
    -- nvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
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
        event = "filetype",
    },
    -- vim-unimpaired
    {
        "tpope/vim-unimpaired",
        event = "UIEnter",
    },
    -- AnsiEsc.vim
    {
        "Makaze/AnsiEsc",
        event = "BufReadPre",
    },
    -- build.nvim
    {
        "cyuria/build.nvim",
        event = "UIEnter",
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
