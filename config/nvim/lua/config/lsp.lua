vim.lsp.enable("clangd")
vim.lsp.enable("prosemd-lsp", vim.fn.executable("prosemd-lsp") ~= 0)
vim.lsp.enable("zls", vim.fn.executable("zls") ~= 0)
vim.lsp.enable("glsl-lsp", vim.fn.executable("glsl-lsp") ~= 0)
vim.lsp.enable("tinymist", vim.fn.executable("tinymist") ~= 0)

vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

vim.lsp.config("prosemd-lsp", {})
vim.lsp.config("glsl-lsp", {
	cmd = { "glsl-lsp" },
	filetypes = { "glsl" },
	root_dir = function(fname)
		return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
	end,
	settings = {},
})
