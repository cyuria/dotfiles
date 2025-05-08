-- Enable profiling
if require 'dependencies'.enable_version then
    vim.loader.enable()
end

require 'config.options'
if require 'dependencies'.enable_plugins then
    require 'config.lazy'
    vim.cmd.colorscheme('evergarden')
end
require 'config.lsp'
require 'config.remap'
require 'config.autocommands'
