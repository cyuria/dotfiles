local bufnr = vim.api.nvim_get_current_buf()

vim.bo[bufnr].expandtab = false
vim.bo[bufnr].shiftwidth = 8
vim.bo[bufnr].tabstop = 8
