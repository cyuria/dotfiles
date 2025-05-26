---@type LazySpec
return {
    {
        "kylechui/nvim-surround",
        keys = {
            "<leader>ys",
            "<leader>y<leader>",
            "<leader>yS",
            "<leader>yS<leader>",
            "<leader>S",
            "<leader>gS",
            "<leader>ds",
            "<leader>cs",
            "<leader>cS",
        },
        opts = {
            keymaps = {
                normal = "<leader>ys",
                normal_cur = "<leader>y<leader>",
                normal_line = "<leader>yS",
                normal_line_cur = "<leader>yS<leader>",
                visual = "<leader>S",
                visual_line = "<leader>gS",
                delete = "<leader>ds",
                change = "<leader>cs",
                change_line = "<leader>cS",
            },
        },
        dependencies = {
            "nvim-treesitter",
        }
    }
}
