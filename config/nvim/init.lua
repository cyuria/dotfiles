-- Enable profiling
if require 'dependencies'.enable_version then
    vim.loader.enable()
end

require 'config.optsetup'
if require 'dependencies'.enable_plugins then
    require 'config.lazysetup'
end
require 'config.remap'
require 'config.autocommands'.load()
require 'config.coloursetup'
if require 'dependencies'.enable_plugins then
    require 'config.felinesetup'
    require 'config.tabbysetup'
end

-- Set colorscheme
require 'config.coloursetup'.dark()
