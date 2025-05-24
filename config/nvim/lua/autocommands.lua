local augroup = vim.api.nvim_create_augroup("openBufOpts", {})

-- Repoen files with cursor in last location
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
    group = augroup,
    desc = 'return cursor to where it was last time closing the file',
    pattern = '*',
    command = 'silent! normal! g`"zv',
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
