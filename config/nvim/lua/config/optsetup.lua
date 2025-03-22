-- Seat leader key to spacebar
vim.g.mapleader = ' '

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Formatting stuff for line numbers, new split windows and searching
--vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.splitright = true
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
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 3
vim.opt.foldmethod = "expr"
vim.opt.foldminlines = 1

-- Neovide stuff
vim.g.neovide_hide_mouse_when_typing = true

-- Disable perl provider so :checkhealth stops complaining
vim.g.loaded_perl_provider = 0

-- I have absolutely no clue why this is default
vim.g.zig_fmt_autosave = 0

-- Interpret .h files as c
vim.g.c_syntax_for_h = 1

-- Remove extra menu items from mouse right click menu
vim.cmd('aunmenu PopUp.How-to\\ disable\\ mouse')
vim.cmd('aunmenu PopUp.-1-')

vim.filetype.add({
    extension = {
        gltf = "json",
        frag = "glsl",
        vert = "glsl",
        mesh = "glsl",
        ino = "cpp",
    }
})

-- rustaceanvim takes options as arguments
vim.g.rustaceanvim = {
    server = {
        cmd = function ()
            local mason_registry = require('mason-registry')
            if mason_registry.is_installed('rust-analyzer') then
                -- This may need to be tweaked depending on the operating system.
                local ra = mason_registry.get_package('rust-analyzer')
                local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
                return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
            else
                -- global installation
                return { 'rust-analyzer' }
            end
        end,

    },
}

