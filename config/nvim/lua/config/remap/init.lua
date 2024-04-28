if require 'dependencies'.enable_plugins then
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    vim.keymap.set('n', '<leader>zm', vim.cmd.ZenMode)
    vim.keymap.set('n', '<leader>aph', vim.cmd.Alpha)
end

vim.keymap.set('n', 'ZA', function() vim.cmd'wqa!' end, {})

vim.keymap.set('n', '<leader>dm', require'config.coloursetup'.dark)
vim.keymap.set('n', '<leader>lm', require'config.coloursetup'.light)

require'config.remap.functionmappings'

if require 'dependencies'.enable_plugins then
    require 'config.remap.beaconmappings'
    require 'config.remap.persistencemappings'
    require 'config.remap.troublemappings'
end
