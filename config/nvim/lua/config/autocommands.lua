local function load()
    local augroup = vim.api.nvim_create_augroup("openBufOpts", {})
    -- ctags
    vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
        group = augroup,
        callback = require 'config.functions'.reloadCtags,
    });
    -- colourschemes
    vim.api.nvim_create_autocmd({ "colorscheme" }, {
        group = augroup,
        callback = function ()
            if vim.o.background == 'dark' then
                require "config.coloursetup".transparent_folds()
            end
        end,
    })
    if require 'dependencies'.enable_discord then
        vim.api.nvim_create_autocmd({ "BufLeave" }, {
            group = augroup,
            command = 'NvimcordUpdate',
        })
        vim.api.nvim_create_autocmd({ "DirChanged" }, {
            group = augroup,
            callback = function ()
                local wsname = require 'nvimcord.workspace'.get_name()
                require 'nvimcord.discord'.config.workspace_name = wsname
            end
        })
    end
    if require 'dependencies'.enable_unmerged then
        vim.api.nvim_create_autocmd({ "FoldChanged" }, {
            group = augroup,
            callback = function ()
                vim.cmd("call matchup#matchparen#hightlight_surrounding()")
            end,
        })
    end
end

return {
    load = load,
}
