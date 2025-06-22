---@type LazySpec
return {
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        config = function()
            require('nordic').load()
        end,
    },
}
