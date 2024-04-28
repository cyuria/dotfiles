
-- nvim beacon settings
vim.keymap.set('n', '<leader>b', function() vim.cmd 'Beacon' end, {})
for _, k in ipairs({ 'n', 'N', '*', '#' }) do
    vim.keymap.set('n', k, k .. ':Beacon<cr>', { noremap = true })
end
