-- Enable profiling
if require 'dependencies'.enable_version then
    vim.loader.enable()
end

require 'config.options'
if require 'dependencies'.enable_plugins then
    require 'config.lazy'
    vim.cmd.colorscheme('evergarden')
end
require 'config.remap'
require 'config.autocommands'
if require 'dependencies'.enable_plugins then
    require 'config.feline'
end
