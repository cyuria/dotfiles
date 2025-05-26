vim.lsp.enable('clangd')
vim.lsp.enable('zls')
vim.lsp.enable('glsl-lsp')

vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })

vim.lsp.config('glsl-lsp', {
        cmd = { 'glsl-lsp' },
        filetypes = { 'glsl' },
        root_dir = function (fname)
            return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
        end,
        settings = {},
})
