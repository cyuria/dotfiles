-- Enable profiling
if require 'dependencies'.enable_version then
    vim.loader.enable()
end

require 'options'
if require 'dependencies'.enable_plugins then
    require 'plugins'
    vim.cmd.colorscheme('evergarden')
end
require('lsp')
require('remap')
require('autocommands')
