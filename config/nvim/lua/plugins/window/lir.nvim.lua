---@type LazySpec
return {
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
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "tamago324/lir-mmv.nvim",
            "lir-git-status.nvim",
        }
    },
    {
        "tamago324/lir-git-status.nvim",
        event = "VeryLazy",
        opts = { show_ignored = true, },
        config = function(_, opts)
            require 'lir.git_status'.setup(opts)
        end,
    }
}
