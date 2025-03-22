-- Autocommands
-- use function for smaller scope
local ftypeopts = {
    defaults = {
        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
    },
    c = {
        tabstop = 8,
        shiftwidth = 8,
        expandtab = false,
    },
    asm = {
        tabstop = 8,
        shiftwidth = 8,
        expandtab = false,
    },
    help = {
        expandtab = false,
        modeline = true,
        tabstop = 8,
        shiftwidth = 8,
    },
    vimdoc = {
        expandtab = false,
        modeline = true,
        tabstop = 8,
        shiftwidth = 8,
    },
    cpp = {
        tabstop = 2,
        shiftwidth = 2,
    },
    yaml = {
        tabstop = 2,
        shiftwidth = 2,
    },
    javascript = {
        tabstop = 2,
        shiftwidth = 2,
    },
    typescript = {
        tabstop = 2,
        shiftwidth = 2,
    },
}

local formatonchange = {
    c = true,
    cpp = true,
    javascript = true,
    meson = true,
    rust = true,
    zig = true,
}

local filetypes = {
    gltf = "json",
    frag = "glsl",
    vert = "glsl",
    mesh = "glsl",
    ino = "cpp",
}

local function LoadOpts(opts, buf)
    for key, value in pairs(opts) do
        vim.bo[buf][key] = value
    end
end

local function LoadFiletypeOpts(opts)
    local bufferopts = ftypeopts[vim.bo[opts.buf].filetype] or {}
    LoadOpts(vim.tbl_extend('keep', bufferopts, ftypeopts.defaults), opts.buf)
end

local function load()
    local augroup = vim.api.nvim_create_augroup("openBufOpts", {})
    -- ctags
    vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
        group = augroup,
        callback = require 'config.functions'.reloadCtags,
    });
    -- colourschemes
    vim.api.nvim_create_autocmd({ "colorscheme" }, {
        group = augroup,
        callback = function ()
            if vim.o.background == 'dark' then
                require "config.coloursetup".transparent_folds()
            end
        end,
    })
    --? lsp format
    vim.api.nvim_create_autocmd({ "LspAttach" }, {
        group = augroup,
        callback = function ()
            local border = {
                { '┌', 'FloatBorder' },
                { '─', 'FloatBorder' },
                { '┐', 'FloatBorder' },
                { '│', 'FloatBorder' },
                { '┘', 'FloatBorder' },
                { '─', 'FloatBorder' },
                { '└', 'FloatBorder' },
                { '│', 'FloatBorder' },
            }

            -- Add border to the diagnostic popup window
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '● ', -- Could be '●', '▎', 'x', '■', , 
                },
                float = { border = border },
            })
        end,
    })
    if require 'dependencies'.enable_discord then
        vim.api.nvim_create_autocmd({ "BufLeave" }, {
            group = augroup,
            command = 'NvimcordUpdate',
        })
        vim.api.nvim_create_autocmd({ "DirChanged" }, {
            group = augroup,
            callback = function ()
                local wsname = require 'nvimcord.workspace'.get_name()
                require 'nvimcord.discord'.config.workspace_name = wsname
            end
        })
    end
    if require 'dependencies'.enable_unmerged then
        vim.api.nvim_create_autocmd({ "FoldChanged" }, {
            group = augroup,
            callback = function ()
                vim.cmd("call matchup#matchparen#hightlight_surrounding()")
            end,
        })
    end
end

return {
    load = load,
}
