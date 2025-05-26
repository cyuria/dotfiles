---@type LazySpec
return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        event = "VeryLazy",
        build = "make install_jsregexp",
        config = function()
            require 'luasnip.loaders.from_vscode'.lazy_load()
        end,
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
    }
}
