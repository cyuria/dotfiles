return {
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
}
