---@type vim.lsp.Config
return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git', 'init.lua' },
	settings = { Lua = {
		runtime = {
			version = 'LuaJIT',
		},
		workspace = {
			checkThirdParty = false,
			library = vim.api.nvim_get_runtime_file("", true)
		}
	} },
}
