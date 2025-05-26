---@type LazySpec
return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = true,
        keys = {
            {
                "<leader>sd",
                function() require('persistence').load() end,
                desc = "Load Session for Current Directory",
            },
            {
                "<leader>sl",
                function() require('persistence').load({ last = true }) end,
                desc = "Load Last Session Globally",
            },
            {
                "<leader>ss",
                function() require('persistence').select() end,
                desc = "Select a Session to Load",
            },
        },
    }
}
