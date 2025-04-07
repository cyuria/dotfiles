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

local default = {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }
}

local customconfig = {
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.list_extend(
                        vim.api.nvim_get_runtime_file("", true),
                        { "${3rd}/luv/library", "${template}/jit" }
                    ),
                },
                runtime = {
                    version = type(jit) == 'table' and "LuaJIT" or _VERSION,
                },
            },
        },
    },
    cmake = {
        settings = {
            CMake = {
                filetypes = {
                    "cmake",
                    "cmakelists.txt"
                },
            },
        },
    },
    ltex = {
        settings = {
            ltex = {
                language = "en-AU",
                dictionary = {
                    ['en-AU'] = {
                        "overridable",
                        "toolchain",
                        "makefile",
                        "makefiles",
                        "MSYS",
                        "nasm",
                        "MinGW",
                        "Cygwin",
                        "glibc",
                        "libc",
                        "wrasm",
                        "Uno",
                        "Cyuria",
                        "Heitmann",
                        "cyuria",
                    }
                },
                disabledRules = {
                    ["en-AU"] = {
                        "COPYRIGHT"
                    },
                },
            },
        },
    },
}

local system_lsp = {
    "clangd",
    "zls",
}

local custom_servers = {
    ["glsl-lsp"] = {
        default_config = {
            cmd = { 'glsl-lsp' },
            filetypes = { 'glsl' },
            root_dir = function (fname)
                return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
            end,
            settings = {},
        }
    },
}

local function get(lsp)
    local config = customconfig[lsp] or {}
    return vim.tbl_deep_extend("keep", config, default)
end

return {
    get = get,
    default = default,
    config = customconfig,
    system = system_lsp,
    custom = custom_servers,
}

