local bufnr = vim.api.nvim_get_current_buf()

vim.bo[bufnr].shiftwidth = 2
vim.bo[bufnr].tabstop = 2

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	buffer = bufnr,
	callback = function()
		vim.api.nvim_buf_call(bufnr, vim.lsp.buf.format)
	end,
})
