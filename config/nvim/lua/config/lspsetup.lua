
local default = {
    capabilities = require 'cmp_nvim_lsp'.default_capabilities(),
}

local customconfig = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
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

local function get(lsp)
    local config = customconfig[lsp] or {}
    return vim.tbl_deep_extend("keep", config, default)
end

return {
    get = get,
    default = default,
    config = customconfig,
}

