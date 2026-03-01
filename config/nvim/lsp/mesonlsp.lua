---@type vim.lsp.Config
return {
	cmd = { 'mesonlsp', '--lsp' },
	filetypes = { 'meson' },
	root_markers = { 'meson.build' },
}
