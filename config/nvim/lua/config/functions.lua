-- Map <leader>? to google search selected text or motion
local function googleSearch(s_start, s_end)
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    local term = table.concat(lines, '\n')
    vim.fn.system("firefox --search \"" .. term .. "\"", '')
end

-- google search for text with "<leader>?"
vim.keymap.set('n', '<leader>?', function()
    local old_opfunc = vim.go.operatorfunc
    _G.op_func_googlesearch = function()
        googleSearch(vim.fn.getpos("'["), vim.fn.getpos("']"))
        vim.go.operatorfunc = old_opfunc
    end
    vim.go.operatorfunc = 'v:lua.op_func_googlesearch'
    vim.api.nvim_feedkeys('g@', 'n', false)
end, {})
vim.keymap.set('v', '<leader>?', function()
    -- Need to exit visual mode first for marks to work
    local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
    vim.api.nvim_feedkeys(esc, 'x', false)
    googleSearch(vim.fn.getpos("'<"), vim.fn.getpos("'>"))
end, {})

return {
    googleSearch = googleSearch,
}
