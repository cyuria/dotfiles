---@type LazySpec
return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Mason",
        opts = {},
        config = function()
            require 'mason'.setup()
            require 'mason-lspconfig'.setup()
        end,
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "blink.cmp",

            "p00f/clangd_extensions.nvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    }
}
