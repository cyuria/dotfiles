-- Seat leader key to spacebar
vim.g.mapleader = ' '

-- Formatting stuff for line numbers, new split windows and searching
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 150

vim.opt.showtabline = 2

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.undofile = true

-- Set the location of the ctags file
vim.opt.tags = ".tags,tags,./.tags,./tags,~/.tags"
-- Set the search path for :find and :cd
vim.opt.path = ",,**2,../**2"
vim.opt.cdpath = ",,../,**1"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Treesitter based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldminlines = 1

-- Disable perl provider so :checkhealth stops complaining
vim.g.loaded_perl_provider = 0

-- Remove extra menu items from mouse right click menu
vim.cmd('aunmenu PopUp.How-to\\ disable\\ mouse')
vim.cmd('aunmenu PopUp.-1-')
