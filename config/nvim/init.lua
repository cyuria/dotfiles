-- Enable profiling
if require 'config.dependencies'.enable then
    vim.loader.enable()
end

require('config.options')
if require('config.dependencies').enable then
    vim.keymap.set('n', '<leader>', '<nop>')
    require('config.lazy')
end
require('config.functions')
require('config.autocommands')
require('config.lsp')
