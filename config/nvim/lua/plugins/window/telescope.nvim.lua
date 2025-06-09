---@type LazySpec
return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            {
                '<leader>ff',
                function() require('telescope.builtin').find_files() end,
                desc = "Use Telescope to Search for Files",
            },
            {
                '<leader>fb',
                function() require('telescope.builtin').buffers() end,
                desc = "Use Telescope to Search Open Buffers",
            },
            {
                '<leader>fd',
                function() require('telescope.builtin').diagnostics() end,
                desc = "Use Telescope to Search Project Diagnostics",
            },
            {
                '<leader>fD',
                function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end,
                desc = "Use Telescope to Search the Current Buffer's Diagnostics",
            },
            {
                '<leader>fh',
                function() require('telescope.builtin').help_tags() end,
                desc = "Use Telescope to Search the (Neo)Vim Help Pages",
            },
            {
                '<leader>fc',
                function() require('telescope.builtin').colorscheme() end,
                desc = "Use Telescope to Search Available Colour Schemes",
            },
            {
                '<leader>fl',
                function() require('telescope.builtin').git_commits() end,
                desc = "Use Telescope to Search Git Commit History",
            },
            {
                '<leader>fr',
                function() require('telescope.builtin').resume() end,
                desc = "Reopen the Last Telescope Search",
            },
            {
                '<leader>fa',
                function() require('telescope.builtin').builtin() end,
                desc = "Use Telescope to Search Telescope Pickers",
            },
            {
                '<leader>ft',
                function() require('telescope').extensions['todo-comments'].todo() end,
                desc = "Use Telescope to Search Project Todo Comments",
            },
            {
                '<leader>fg',
                function() require('telescope').extensions.live_grep_args.live_grep_args() end,
                desc = "Use Telescope to Grep Project Files with Live Arguments",
            },
        },
        opts = {},
        config = function()
            require 'telescope'.load_extension 'live_grep_args'
            require 'telescope'.load_extension 'todo-comments'
            require 'telescope'.load_extension 'fzf'
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "telescope-fzf-native.nvim",

            "nvim-telescope/telescope-live-grep-args.nvim",
            "todo-comments.nvim",
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release',
        event = "VeryLazy",
    }
}
