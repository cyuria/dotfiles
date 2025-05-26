---@type LazySpec
return {
    {
        "Lommix/bevy_inspector.nvim",
        dependencies = {
            "telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = true,
        cmd = { "BevyInspect", "BevyInspectNamed", "BevyInspectQuery" },
    }
}
