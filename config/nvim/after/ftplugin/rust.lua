local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>g", function()
	-- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
	vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	buffer = bufnr,
	callback = function()
		vim.api.nvim_buf_call(bufnr, function()
			require("conform").format()
		end)
	end,
})
