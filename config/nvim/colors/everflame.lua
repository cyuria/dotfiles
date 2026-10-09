if vim.g.colors_name then
	vim.cmd.highlight('clear')
end
vim.g.colors_name = "everflame"

vim.g.everflame = vim.tbl_deep_extend("keep", vim.g.everflame or {}, {
	dark_transparent = true,
	light_transparent = false,
})

local hl_background
local hl_normal
local hl_comment
local hl_control
local hl_builtintype
local hl_usertype
local hl_string
local hl_other
local hl_special
local hl_error
local hl_warn
local hl_info

if vim.go.background == "dark" then
	hl_background = "#1C1B1A"
	if vim.g.everflame.dark_transparent then
		hl_background = "none"
	end
	hl_normal = '#E3E2D6'
	hl_comment = '#727A7A'
	hl_control = '#E86C62'
	hl_builtintype = '#EBBF38'
	hl_usertype = '#E0D593'
	-- hl_string = '#B4BE4F'
	hl_string = '#D7EBB2'
	hl_other = '#B8B8B8'
	hl_special = '#D389AD'

	hl_error = '#E32D21'
	hl_warn = hl_builtintype
	hl_info = '#98CF8D'
end

if vim.go.background == "light" then
	hl_background = "#E8E3BE"
	if vim.g.everflame.light_transparent then
		hl_background = "none"
	end
	hl_normal = '#2A291D'
	hl_comment = '#979794'
	hl_control = '#C33749'
	hl_builtintype = '#B88507'
	hl_usertype = '#756631'
	-- hl_string = '#B4BE4F'
	hl_string = '#698138'
	hl_other = '#6C6C6C'
	hl_special = '#9b466d'

	hl_error = '#E32D21'
	hl_warn = hl_builtintype
	hl_info = '#456C59'
end

vim.cmd.highlight('Normal guifg=' .. hl_normal .. ' guibg=' .. hl_background)
vim.cmd.highlight('Keyword guifg=' .. hl_control)
vim.cmd.highlight('Statement guifg=' .. hl_control)
vim.cmd.highlight('String guifg=' .. hl_string)
vim.cmd.highlight('Type guifg=' .. hl_builtintype)
vim.cmd.highlight('Comment guifg=' .. hl_comment .. ' gui=italic')

vim.cmd.highlight('Special guifg=' .. hl_special)
vim.cmd.highlight('Constant guifg=' .. hl_special)

vim.cmd.highlight('Identifier guifg=' .. hl_normal)
vim.cmd.highlight('@variable guifg=' .. hl_normal)
vim.cmd.highlight('@module guifg=' .. hl_normal)

-- vim.cmd.highlight('@function guifg=#FAC1E0')
-- vim.cmd.highlight('@function guifg=#FAEAF1')
vim.cmd.highlight('@function guifg=' .. hl_normal)
vim.cmd.highlight('@function.method guifg=' .. hl_normal)
-- vim.cmd.highlight('@function.method guifg=#DED0E6')

vim.cmd.highlight('Operator guifg=' .. hl_other)
vim.cmd.highlight('Delimiter guifg=' .. hl_other)

-- vim.cmd.highlight('@type guifg=#E3E2D6')
vim.cmd.highlight('@type guifg=' .. hl_usertype)
vim.cmd.highlight('@type.builtin guifg=' .. hl_builtintype)

vim.cmd.highlight('Directory guifg=' .. hl_other)

vim.cmd.highlight('DiffAdd guibg=#445E2A')
vim.cmd.highlight('DiffChange guibg=#2C313B')
vim.cmd.highlight('DiffDelete guibg=#91342D')
vim.cmd.highlight('DiffText guibg=#5A667A')

vim.cmd.highlight('ErrorMsg guifg=' .. hl_error)
vim.cmd.highlight('ModeMsg guifg=' .. hl_special)
vim.cmd.highlight('MoreMsg guifg=' .. hl_special)
vim.cmd.highlight('Question guifg=' .. hl_special)
vim.cmd.highlight('QuickFixLine guifg=' .. hl_special)

vim.cmd.highlight('DiagnosticUnderlineError guisp=' .. hl_error)
vim.cmd.highlight('DiagnosticError guifg=' .. hl_error)
vim.cmd.highlight('DiagnosticWarn guifg=' .. hl_warn)
vim.cmd.highlight('DiagnosticInfo guifg=' .. hl_info)

