-- All non default keybinds should start with <leader>, which is space
vim.g.mapleader = " "

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Formatting stuff for line numbers, new split windows and searching
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 100

vim.opt.showtabline = 1

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.undofile = true

vim.opt.foldlevelstart = 3
vim.opt.foldmethod = "expr"
vim.opt.foldminlines = 1

-- Set the search path for :find and :cd
vim.opt.path = ",,**2,../**2"
vim.opt.cdpath = ",,../,**1"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Neovide stuff
vim.g.neovide_hide_mouse_when_typing = true

-- Disable perl provider so :checkhealth stops complaining
vim.g.loaded_perl_provider = 0

-- Interpret .h files as c
vim.g.c_syntax_for_h = 1

-- Remove extra menu items from mouse right click menu
vim.cmd.aunmenu("PopUp.How-to\\ disable\\ mouse")
vim.cmd.aunmenu("PopUp.-2-")

vim.filetype.add({
	extension = {
		gltf = "json",
		frag = "glsl",
		vert = "glsl",
		mesh = "glsl",
		ino = "cpp",
	},
})

vim.diagnostic.config({ virtual_lines = true })

-- rustaceanvim takes options as arguments
vim.g.rustaceanvim = { server = { cmd = { "rust-analyzer" } } }

-- Colourscheme stuff
vim.g.gruvbox_contrast_dark = "soft"
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 1
