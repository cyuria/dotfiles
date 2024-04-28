return {
    -- telescope.nvim
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "todo-comments.nvim",
            "nvim-notify",
            "noice.nvim",
            "telescope-fzf-native.nvim",
        },
        config = function()
            require 'telescope'.load_extension 'live_grep_args'
            require 'telescope'.load_extension 'todo-comments'
            require 'telescope'.load_extension 'notify'
            require 'telescope'.load_extension 'noice'
            require 'telescope'.load_extension 'fzf'
            require 'config.remap.telescopemappings'
        end,
    },
    -- telescope-fzf-native.nvim
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        event = "VeryLazy",
    },
    -- lir.nvim + extensions
    {
        "tamago324/lir.nvim",
        event = "VeryLazy",
        opts = function()
            local actions = require 'lir.actions'
            local mark_actions = require 'lir.mark.actions'
            local clipboard_actions = require 'lir.clipboard.actions'
            local mmv_actions = require 'lir.mmv.actions'

            return {
                show_hidden_files = true,
                ignore = { ".git", },
                devicons = {
                    enable = true,
                    hightlight_dirname = true,
                },
                mappings = {
                    ['l'] = actions.edit,
                    ['<C-s>'] = actions.split,
                    ['<C-v>'] = actions.vsplit,
                    ['<C-t>'] = actions.tabedit,

                    ['h'] = actions.up,
                    ['q'] = actions.quit,

                    ['K'] = actions.mkdir,
                    ['N'] = actions.newfile,
                    ['R'] = actions.rename,
                    ['@'] = actions.cd,
                    ['Y'] = actions.yank_path,
                    ['.'] = actions.toggle_show_hidden,
                    ['D'] = actions.delete,

                    ['J'] = function()
                        mark_actions.toggle_mark 'v'
                        vim.cmd 'normal! j'
                    end,
                    ['C'] = clipboard_actions.copy,
                    ['X'] = clipboard_actions.cut,
                    ['P'] = clipboard_actions.paste,

                    ['M'] = mmv_actions.mmv,
                }
            }
        end,
        config = function(_, opts)
            require 'lir'.setup(opts)
            require 'nvim-web-devicons'.set_icon {
                lir_folder_icon = {
                    icon = "",
                    color = "#7ebae4",
                    name = "LirFolderNode"
                },
            }
            vim.api.nvim_create_autocmd({ 'FileType' }, {
                pattern = { "lir" },
                callback = function()
                    vim.keymap.set(
                        'x', 'J',
                        function()
                            require 'lir.mark.actions'.toggle_mark 'v'
                        end,
                        { buffer = true, noremap = true, silent = true, }
                    )
                    vim.api.nvim_echo(
                        { { vim.fn.expand("%:p"), "Normal" } },
                        false,
                        {}
                    )
                end
            })
        end,
        dependencies = {
            "plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "lir-mmv.nvim",
            "lir-git-status.nvim",
        }
    },
    {
        "tamago324/lir-mmv.nvim",
        event = "VeryLazy",
    },
    {
        "tamago324/lir-git-status.nvim",
        event = "VeryLazy",
        opts = { show_ignored = true, },
        config = function(_, opts)
            require 'lir.git_status'.setup(opts)
        end,
    },
    -- vim-fugitive
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
    -- trouble.nvim
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = {
            "Trouble",
            "TroubleClose",
            "TroubleToggle",
            "TroubleRefresh",
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },
    -- noice.nvim
    {
        "folke/noice.nvim",
        lazy = false,
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
    -- octo.nvim
    {
        "pwntester/octo.nvim",
        event = "VeryLazy",
        cond = require 'dependencies'.enable_github,
        opts = {},
        dependencies = {
            "plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        }
    },
    -- nvimcord
    {
        "ObserverOfTime/nvimcord",
        event = "VeryLazy",
        cond = require 'dependencies'.enable_discord,
        branch = "workspace",
        opts = {
            autostart = true,
            large_file_icon = true,
            dynamic_workspace = true,
        }
    },
}
