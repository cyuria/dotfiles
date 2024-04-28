-- Creates an interactive shell process
-- in the current buffer. Returns the job id
-- of the shell
local function createShell(cmd)
    local JID = vim.fn.termopen(vim.g.terminal)
    require'tabby'.update()
    if cmd then
        vim.fn.chansend(JID, cmd)
        vim.fn.chansend(JID, '\r')
    end
    return JID
end

-- Map <c-b> to create a floating window and run createShell(cmd)
local function floatingShell(cmd)
    local stats = vim.api.nvim_list_uis()[1]
    local winconfig = {
        relative = "editor",
        border = "rounded",
        width = math.ceil(stats.width * 0.6),
        height = math.ceil(stats.height * 0.6),
        col = math.ceil(stats.width * 0.2),
        row = math.ceil(stats.height * 0.2)
    }
    local buffer = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_open_win(buffer, true, winconfig)
    return createShell(cmd)
end

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
    createShell = createShell,
    floatingShell = floatingShell,
    reloadCtags = reloadCtags,
    googleSearch = googleSearch,
}
