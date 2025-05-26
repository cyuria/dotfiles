---@type LazySpec
return {
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
    }
}
