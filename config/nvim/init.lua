-- Enable profiling
if require 'config.dependencies'.enable then
    vim.loader.enable()
end

require('config.options')
require('config.functions')
if require('config.dependencies').enable then
    vim.keymap.set('n', '<leader>', '<nop>')
    require('config.lazy')
    vim.cmd.colorscheme('evergarden')
end
require('config.lsp')
require('config.autocommands')
