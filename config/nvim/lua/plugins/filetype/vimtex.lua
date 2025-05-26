---@type LazySpec
return {
    {
        "lervag/vimtex",
        filetype = "tex",
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    }
}
