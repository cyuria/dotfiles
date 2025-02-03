return {
    -- which-key.nvim
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- persistence.nvim
    {
        "folke/persistence.nvim",
        lazy = false,
        opts = {},
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
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
        event = "VeryLazy",
        opts = {
            check_ts = true, -- use treesitter
        },
        dependencies = {
            "nvim-cmp",
        },
    },
    -- nvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = true,
        dependencies = {
            "nvim-treesitter",
        },
    },
    -- vim-lastplace
    {
        "farmergreg/vim-lastplace",
        lazy = false,
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
        event = "VeryLazy",
        opts = {
            filetypes = {},
            defaults = {},
        },
        config = function(_, opts)
            require 'colorizer'.setup(opts.filetypes, opts.defaults)
        end
    },
    -- gitsigns.nvim
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            current_line_blame = true,
            current_line_blame_formatter = '<author>, <summary> - <author_time:%d/%m/%Y>',
        },
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
        event = "VeryLazy",
    },
    -- AnsiEsc.vim
    {
        "vim-scripts/AnsiEsc.vim",
        event = "VeryLazy",
    },
    -- build.nvim
    {
        "cyuria/build.nvim",
        dev = true,
        event = "VeryLazy",
        opts = {
            extra_programs = {
                make = function (root, _)
                    if not root then
                        return "unbuffer make $*"
                    end
                    return "unbuffer make $* -C " .. root
                end,
            },
        },
    }
}
