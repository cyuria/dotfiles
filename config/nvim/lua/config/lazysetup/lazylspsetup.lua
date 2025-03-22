---@type LazySpec
return {
    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        event = "VeryLazy",
        build = require 'dependencies'.gmake .. " install_jsregexp",
        config = function ()
            require 'luasnip.loaders.from_vscode'.lazy_load()
        end,
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
    },
    -- mason.nvim
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Mason",
        opts = {},
        config = function ()
            local lspconfig = require 'lspconfig'
            local cfg = require 'config.lspsetup'

            require 'mason'.setup()
            require 'mason-lspconfig'.setup()
            require 'mason-lspconfig'.setup_handlers {
                -- Default setup
                function (lspname)
                    lspconfig[lspname].setup(cfg.get(lspname))
                end,
                -- don't use rust-analyser because of rustaceanvim
                ["rust_analyzer"] = function (_) end
            }
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "blink.cmp",

            "p00f/clangd_extensions.nvim",
            "rustaceanvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    },
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local lspconfig = require('lspconfig')
            local configs = require('lspconfig.configs')
            local cfg = require('config.lspsetup')

            for _, lsp in ipairs(cfg.system) do
                lspconfig[lsp].setup(cfg.get(lsp))
            end

            for lsp, custom in pairs(cfg.custom) do
                if not configs[lsp] then
                    configs[lsp] = custom
                    configs[lsp].setup{cfg.get(lsp)}
                end
            end
        end
    },
    -- blink.cmp
    {
        "saghen/blink.cmp",
        event = { "InsertEnter", "VeryLazy" },
        dependencies = {
            "LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        version = '*',
        opts = function ()
            local function getSystemTriple()
                local system_triple_cmd = vim.system({'cc', '-dumpmachine'}, { text = true }):wait()
                if system_triple_cmd.code ~= 0 then
                    print("something somewhere went terribly wrong")
                    return nil
                end

                -- strip whitespace
                local stdout = system_triple_cmd.stdout:gsub('%s+', '')
                -- split into parts for further processing
                local triple = vim.fn.split(stdout, '-')
                if triple[3] == "linux" then
                    triple[2] = "unknown"
                end
                return vim.fn.join(triple, '-')
            end

            ---@type blink.cmp.Config
            return {
                keymap = {
                    preset = 'default',
                    ['<C-enter>'] = { 'select_and_accept' },
                },
                completion = {
                    accept = { auto_brackets = { enabled = true } },
                    documentation = { auto_show = true },
                    ghost_text = { enabled = true },
                },
                appearance = {
                    use_nvim_cmp_as_default = true,
                    nerd_font_variant = 'mono',
                },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                fuzzy = {
                    prebuilt_binaries = {
                        download = true,
                        force_system_triple = getSystemTriple(),
                    },
                },
                snippets = {
                    preset = 'luasnip',
                },
                signature = { enabled = true },
            }
        end,
        opts_extend = { "sources.default" },
    },
    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = {
            ":TSUpdate",
            ":TSInstall all",
        },
        lazy = false,
        opts = {
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            matchup = {
                enable = true,
            }
        },
        config = function (_, opts)
            -- Use clang, as other compilers break stuff
            require 'nvim-treesitter.install'.compilers = { "clang" }
            -- Use tar + curl instead of git
            require 'nvim-treesitter.install'.prefer_git = false
            -- Initialise treesitter
            require 'nvim-treesitter.configs'.setup(opts)

            vim.treesitter.language.register("htmldjango", "html")
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^5',
        lazy = false,
    },
}
