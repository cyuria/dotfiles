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

local function loadSavedColorScheme()
    local file_path = vim.fn.stdpath('data') .. '/saved_colourscheme'
    local file, open_err = vim.uv.fs_open(file_path, "r", 432)
    if open_err ~= nil then
        vim.notify(open_err .. " Could not open file '" .. file_path .. "' for reading to load cached color scheme")
        return
    end
    assert(file ~= nil)
    local stat, stat_err = vim.uv.fs_stat(file_path)
    if stat == nil then
        error(stat_err .. " Could not stat file '" .. file_path .. "' to load cached color scheme")
        return
    end
    local colorscheme, read_err = vim.uv.fs_read(file, stat.size, 0)
    if read_err ~= nil then
        error(read_err .. " Could not read file '" .. file_path .. "' to load cached color scheme")
    end
    vim.cmd.colorscheme(colorscheme)
    local _, close_err = vim.uv.fs_close(file)
    if close_err ~= nil then
        error(close_err .. " Could not close file '" .. file_path .. "' to load cached color scheme")
    end
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

loadSavedColorScheme()

return {
    googleSearch = googleSearch,
    loadSavedColorScheme = loadSavedColorScheme,
}
