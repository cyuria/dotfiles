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
    vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
        group = augroup,
        callback = function()
            if formatonchange[vim.bo.filetype] then
                vim.lsp.buf.format()
            end
        end
    })
    vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
        group = augroup,
        callback = require 'config.functions'.reloadCtags,
    });
    --vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
    --    group = augroup,
    --    command = "norm zx"
    --});
    vim.api.nvim_create_autocmd({ "colorscheme" }, {
        group = augroup,
        callback = function ()
            if vim.o.background == 'dark' then
                require "config.coloursetup".transparent_folds()
            end
        end,
    })
    vim.api.nvim_create_autocmd({ "FileType" }, {
        group = augroup,
        callback = LoadFiletypeOpts,
    })
    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = augroup,
        callback = function()
            vim.keymap.set(
                't', '<c-e>',
                vim.cmd.stopinsert,
                { buffer = 0, }
            )
            vim.cmd.setlocal 'nornu nonumber'
            vim.api.nvim_buf_set_name(0, string.match(
                vim.api.nvim_buf_get_name(0),
                '//[0-9]*:%S+'
            ))
            vim.cmd 'startinsert'
        end,
    });
    vim.api.nvim_create_autocmd({ "TermClose" }, {
        group = augroup,
        command = 'bd!',
    })
    vim.api.nvim_create_autocmd({ "LspAttach" }, {
        group = augroup,
        callback = function(args)
            -- See :h vim.lsp.formatexpr()
            vim.bo[args.buf].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'
        end,
    })
    if require 'dependencies'.enable_discord then
        vim.api.nvim_create_autocmd({ "BufLeave" }, {
            group = augroup,
            command = 'NvimcordUpdate',
        })
        vim.api.nvim_create_autocmd({ "DirChanged" }, {
            group = augroup,
            callback = function()
                local wsname = require 'nvimcord.workspace'.get_name()
                require 'nvimcord.discord'.config.workspace_name = wsname
            end
        })
    end
    if require 'dependencies'.enable_unmerged then
        vim.api.nvim_create_autocmd({ "FoldChanged" }, {
            group = augroup,
            callback = function()
                vim.cmd("call matchup#matchparen#hightlight_surrounding()")
            end,
        })
    end
    vim.filetype.add({
        extension = filetypes,
    })
end

return {
    load = load,
}
