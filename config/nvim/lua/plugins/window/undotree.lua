---@type LazySpec
return {
    {
        "mbbill/undotree",
        cmd = {
            "UndotreeToggle",
            "UndotreeHide",
            "UndotreeShow",
            "UndotreeFocus",
            "UndotreePersistUndo",
        },
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undo Tree" },
        }
    }
}
