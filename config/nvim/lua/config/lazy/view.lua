---@type LazySpec
return {
    -- twilight.nvim
    {
        "folke/twilight.nvim",
        cmd = {
            "Twilight",
            "TwilightEnable",
            "TwilightDisable",
        },
        opts = {
            dimming = { alpha = 0.7, },
            context = 20,
        },
    },
    -- zen-mode.nvim
    {
        "folke/zen-mode.nvim",
        opts = {},
        cmd = "ZenMode",
        dependencies = {
            "twilight.nvim",
        },
    },
    -- alpha-nvim
    {
        "goolord/alpha-nvim",
        lazy = false,
        opts = require'config.alpha'.config,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    -- feline.nvim
    {
        "famiu/feline.nvim",
        lazy = false,
        opts = function () return require'config.feline' end,
        config = function (_, opts)
            local feline = require'feline'
            feline.setup(opts)
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "gitsigns.nvim",
            "tokyonight.nvim",
        },
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
    -- noice.nvim
    {
        "folke/noice.nvim",
        lazy = false,
        enabled = false,
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    view = "popup",
                    filter = {
                        min_height = 10,
                        cmdline = true,
                    },
                },
                {
                    view = "split",
                    filter = {
                        min_height = 20,
                    },
                },
            },
        },
        dependencies = {
            "muniftanjim/nui.nvim",
            "nvim-notify",
        },
    },
    -- nvim-notify
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            top_down = false,
            fps = 20,
            background_colour = "#000000",
        },
    },
    -- nvim-treesitter-context
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "filetype",
        opts = {},
        dependencies = {
            "nvim-treesitter",
        },
    },
}
