---@type vim.lsp.Config
return {
		cmd = { 'rust-analyzer' },
		filetypes = { 'rust' },
		root_markers = { 'Cargo.toml', 'Cargo.lock' },
}
