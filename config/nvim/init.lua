vim.g.mapleader = ' '
vim.opt.exrc = true
vim.opt.number = true
vim.opt.path = { '.', './*', './**/*', '../**/*' }
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 0
vim.opt.spelllang = { 'en_au', 'de' }
vim.cmd.colorscheme('retrobox')

vim.keymap.set('', '<leader>', '<nop>')

vim.lsp.config('*', {
	root_markers = { '.git' },
})

vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('mesonlsp')
vim.lsp.enable('neocmakelsp')
vim.lsp.enable('tinymist')
vim.lsp.enable('ty')
vim.lsp.enable('zls')

vim.pack.add({
	-- 'https://github.com/cyuria/build.nvim',
	'/home/cyuria/code/build.nvim',
	'https://github.com/mvllow/modes.nvim',
	'https://github.com/nvim-mini/mini.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1') },
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/tpope/vim-fugitive',
})

require('blink.cmp').setup()
require('build').setup()
require('mini.git').setup()
require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.surround').setup({
	mappings = {
		add = '<leader>sa',
		delete = '<leader>sd',
		find = '<leader>sf',
		find_left = '<leader>sF',
		highlight = '<leader>sh',
		replace = '<leader>sr',
	},
})
require('modes').setup({
	line_opacity = { visual = 0.4 },
})
require('oil').setup()
