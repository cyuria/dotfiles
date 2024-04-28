-- configure telescope.nvim
local builtin = require 'telescope.builtin'
local telescope = require 'telescope'

-- files (ff)
vim.keymap.set(
    'n',
    '<leader>ff',
    builtin.find_files,
    { desc = "Telescope find_files" }
)
-- workspace symbols (fw)
vim.keymap.set(
    'n',
    '<leader>fw',
    builtin.lsp_workspace_symbols,
    { desc = "Telescope workspace_symbols" }
)
-- treesitter (fv)
vim.keymap.set(
    'n',
    '<leader>fv',
    builtin.treesitter,
    { desc = "Telescope treesitter" }
)
-- buffers (fb)
vim.keymap.set(
    'n',
    '<leader>fb',
    builtin.buffers,
    { desc = "Telescope buffers" }
)
-- help pages (fh)
vim.keymap.set(
    'n',
    '<leader>fh',
    builtin.help_tags,
    { desc = "Telescope help" }
)
-- todo comments (ft)
vim.keymap.set(
    'n',
    '<leader>ft',
    telescope.extensions['todo-comments'].todo,
    { desc = "Telescope todo" }
)
-- colour schemes (fc)
vim.keymap.set(
    'n',
    '<leader>fc',
    builtin.colorscheme,
    { desc = "Telescope colourschemes" }
)
-- grep (fg)
vim.keymap.set(
    'n',
    '<leader>fg',
    telescope.extensions.live_grep_args.live_grep_args,
    { desc = "Telescope grep" }
)
-- git commits (fl)
vim.keymap.set(
    'n',
    '<leader>fl',
    builtin.git_commits,
    { desc = "Telescope git_commits" }
)
-- Search diagnostics (fd/fD)
vim.keymap.set(
    'n',
    '<leader>fd',
    builtin.diagnostics,
    { desc = "Telescope workspace diagnostics" }
)
vim.keymap.set(
    'n',
    '<leader>fD',
    function() builtin.diagnostics({ bufnr = 0 }) end,
    { desc = "Telescope document diagnostics" }
)
-- Search the solar system
vim.keymap.set(
    'n',
    '<leader>fu',
    function() builtin.planets({ show_pluto = true, show_moon = true }) end,
    { desc = "Telescope planets" }
)
-- Use the last picker
vim.keymap.set(
    'n',
    '<leader>fr',
    builtin.resume,
    { desc = "Telescope resume" }
)
-- List picker options, <CR> to use them
vim.keymap.set(
    'n',
    '<leader>fa',
    builtin.builtin,
    { desc = "Telescope pickers" }
)
-- Notifications
vim.keymap.set(
    'n',
    '<leader>fn',
    telescope.extensions.notify.notify,
    { desc = "Telescope notify" }
)
