vim.g.mapleader = ' '
vim.opt.scrolloff = 2
vim.opt.shiftwidth = 0
vim.opt.exrc = true
vim.opt.undofile = true
vim.opt.path = { '.', './*', './**/*' }
vim.opt.spelllang = { 'en_au', 'de' }
vim.opt.foldlevel = 999

vim.keymap.set('', '<leader>', '<nop>')

vim.diagnostic.config({
	signs = false,
	virtual_text = true,
})

vim.lsp.config('*', {
	root_markers = { '.git' },
})

vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('mesonlsp')
vim.lsp.enable('neocmakelsp')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('templ')
vim.lsp.enable('tinymist')
vim.lsp.enable('ty')
vim.lsp.enable('zls')

vim.pack.add({
	{ src = 'https://codeberg.org/evergarden/nvim', name = "evergarden" },
	{ src = 'https://github.com/cyuria/build.nvim' },
	{ src = 'https://github.com/mvllow/modes.nvim' },
	{ src = 'https://github.com/nvim-mini/mini.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1') },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/tpope/vim-fugitive' },
})

vim.cmd.colorscheme('everflame')

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
require('evergarden').setup({
	editor = { transparent_background = true },
	style = {
		keyword = {},
		types = {},
	},
})

-- vim.cmd.colorscheme('evergarden')

-- this should really be default imo
vim.api.nvim_create_autocmd({ 'FileType' }, {
	callback = function (args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if not lang or not vim.treesitter.language.add(lang) then return end
		if vim.treesitter.query.get(lang, "highlights") then
			vim.treesitter.start(args.buf)
		end
    	if vim.treesitter.query.get(lang, "indents") then
      		vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
    	end
    	if vim.treesitter.query.get(lang, "folds") then
    		vim.opt_local.foldmethod = "expr"
    		vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    	end
	end
})
