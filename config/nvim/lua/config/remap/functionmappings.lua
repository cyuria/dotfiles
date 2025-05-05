local functions = require'config.functions'

-- Create mappings to load interactive shells in different
-- window configurations
vim.keymap.set('n', '<leader>?', function ()
    local old_opfunc = vim.go.operatorfunc
    _G.op_func_googlesearch = function ()
        functions.googleSearch(
            vim.fn.getpos("'["),
            vim.fn.getpos("']")
        )
        vim.go.operatorfunc = old_opfunc
    end
    vim.go.operatorfunc = 'v:lua.op_func_googlesearch'
    vim.api.nvim_feedkeys('g@', 'n', false)
end, {})
vim.keymap.set('v', '<leader>?', function ()
    -- Need to exit visual mode first for marks to work
    local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
    vim.api.nvim_feedkeys(esc, 'x', false)
    functions.googleSearch(
        vim.fn.getpos("'<"),
        vim.fn.getpos("'>")
    )
end, {})
