---@type LazySpec
return {
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                vim.cmd.Trouble,
                desc = "Open Trouble dialogue",
            },
            {
                "<leader>xd",
                function() vim.cmd.Trouble("diagnostics toggle") end,
                desc = "Open Diagnostics in Trouble",
            },
            {
                "<leader>xt",
                function() vim.cmd.Trouble("todo toggle") end,
                desc = "Open Todo Comments in Trouble",
            },
            {
                "<leader>xl",
                function() vim.cmd.Trouble("loclist toggle") end,
                desc = "Open Location List in Trouble",
            },
            {
                "<leader>xq",
                function() vim.cmd.Trouble("quickfix toggle") end,
                desc = "Open Quickfix List in Trouble",
            },
            {
                "<leader>xr",
                function() vim.cmd.Trouble("lsp_references toggle") end,
                desc = "Open LSP References in Trouble",
            },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    }
}
