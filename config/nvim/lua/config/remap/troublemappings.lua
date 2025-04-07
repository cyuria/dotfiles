
-- trouble.nvim key mappings
vim.keymap.set(
    "n", "<leader>xx",
    "<cmd>Trouble<cr>",
    { silent = true }
)
vim.keymap.set(
    "n", "<leader>xd",
    "<cmd>Trouble diagnostics<cr>",
    { silent = true }
)
vim.keymap.set(
    "n", "<leader>xt",
    "<cmd>Trouble todo<cr>",
    { silent = true }
)
vim.keymap.set(
    "n", "<leader>xl",
    "<cmd>Trouble loclist<cr>",
    { silent = true }
)
vim.keymap.set(
    "n", "<leader>xq",
    "<cmd>Trouble quickfix<cr>",
    { silent = true }
)
vim.keymap.set(
    "n", "<leader>xr",
    "<cmd>Trouble lsp_references<cr>",
    { silent = true }
)

