---@type LazySpec
return {
    {
        "ObserverOfTime/nvimcord",
        event = "VeryLazy",
        cmd = {
            "NvimcordAssets",
            "NvimcordFiletypes",
            "NvimcordStop",
            "NvimcordUpdate",
        },
        opts = {
            large_file_icon = true,
            dynamic_workspace = true,
        }
    }
}
