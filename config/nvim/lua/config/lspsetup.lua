
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
    snyk = {
        init_options = {
            snyk = {
                activateSnykCode = true
            }
        }
    },
    zls = {
        settings = {

        }
    },
}

local system_lsp = {
    "clangd",
    "zls",
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
}

