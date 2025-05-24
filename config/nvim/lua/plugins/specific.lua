---@type LazySpec
return {
    -- rustaceanvim
    {
        "mrcjkb/rustaceanvim",
        version = '^6',
        lazy = false,
    },
    -- vimtex
    {
        "lervag/vimtex",
        filetype = "tex",
        init = function ()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    -- bevy_inspector.nvim
    {
        "Lommix/bevy_inspector.nvim",
        dependencies = {
            "telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = true,
        cmd = { "BevyInspect", "BevyInspectNamed", "BevyInspectQuery" },
    },
}
