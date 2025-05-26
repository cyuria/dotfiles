---@type LazySpec
return {
    {
        "sainnhe/everforest",
        lazy = false,
        config = function()
            vim.g.everforest_enable_italic = true
            vim.g.everforest_background = 'hard'
        end,
    },
}
