
local theme = {
    fill = 'TabLineFill',
    head = 'TabLine',
    current_tab = 'TabLineSel',
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
}

local tabby_api = require('tabby.module.api')
local tabby_buf_name = require('tabby.feature.buf_name')

local function clearTabName(tabpage)
    local ok, result = pcall(vim.api.nvim_tabpage_del_var, tabpage, 'tabby_tab_name')
    if not ok then
        print(result)
    end
end

vim.api.nvim_create_user_command('TabName', function(cmd)
    if cmd.args ~= '' then
        require('tabby.feature.tab_name').set_name(cmd.args)
    end
end, { nargs = '*' })
vim.api.nvim_create_user_command('ClearTabName', function()
    clearTabName(0)
end, {})

require'tabby.feature.tab_name'.set_default_option({
    name_fallback = function (tabid)
        local cur_win = tabby_api.get_tab_current_win(tabid)
        if tabby_api.is_float_win(cur_win) then
            return '[Floating]'
        end
        local name = tabby_buf_name.get(cur_win)
        local wins = tabby_api.get_tab_wins(tabid)
        if #wins > 1 then
            name = tostring(#wins) .. ' ' .. name
        end
        return name
    end,
})

require('tabby.tabline').set(function (line)
    return {
        {
            { '  ', hl = theme.head },
            line.sep('', theme.fill, theme.head),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep('', theme.fill, theme.tab),
                tab.name(),
                tab.close_btn(''),
                line.sep('', theme.fill, theme.tab),
                hl = hl,
                margin = ' ',
            }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            local name = win.buf_name()
            local lastdotpos = string.find(name, "%.[^%.]*$")
            if lastdotpos ~= nil then lastdotpos = math.min(lastdotpos - 1, 8) end
            return {
                line.sep('', theme.fill, theme.win),
                win.is_current() and '' or '',
                string.sub(win.buf_name(), 1, lastdotpos),
                line.sep('', theme.fill, theme.win),
                hl = theme.win,
                margin = ' ',
            }
        end),
        {
            line.sep('', theme.fill, theme.tail),
            { '  ', hl = theme.tail },
        },
        hl = theme.fill,
    }
end)

