local function reloadCtags()
    vim.system({ "/usr/bin/sh", "-c", "rg --files | ctags -f .tags --recurse -L -" })
end

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
    vim.fn.system("firefox \"https://google.com/search?q=" .. term .. "\" &", '')
end

return {
    reloadCtags = reloadCtags,
    googleSearch = googleSearch,
}
