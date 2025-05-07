-- Setup manual git loading for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If lazy doesn't exist in the filesystem, then git clone it
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- Add lazy path to $RUNTIMEPATH for require'lazy' below
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- nvimesweeper
    {
        "seandewar/nvimesweeper",
        cmd = "Nvimesweeper",
    },
    -- nvim-tetris
    {
        "alec-gibson/nvim-tetris",
        cmd = "Tetris",
    },
    -- blackjack.nvim
    {
        "alanfortlink/blackjack.nvim",
        cmd = "BlackJackNewGame",
    },
    "nvim-lua/plenary.nvim",
    { import = 'config.lazy.lsp' },
    { import = 'config.lazy.colour' },
    { import = 'config.lazy.utility' },
    { import = 'config.lazy.workspace' },
    { import = 'config.lazy.view' },
}

local lazyopts = {
    defaults = {
        lazy = true,
    },
    dev = {
        path = "~/code",
        patterns = { "Cyuria", },
        fallback = true,
    },
    install = {
        missing = true,
        colorscheme = {
            "elly",
            "kanagawa-dragon",
            "nightfox",
            "edge",
            "tokyonight",
            "habamax",
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    rocks = {
        enabled = false,
    },
}

require 'lazy'.setup(plugins, lazyopts)
