local version = vim.version()

return {
    enable_plugins = version.major >= 1 or version.minor >= 11,
    enable_loader = version.major >= 1 or version.minor >= 10,
    enable_github = vim.fn.executable 'gh' == 1,
    enable_discord = vim.uv.fs_stat(vim.fs.joinpath(
        vim.fn.stdpath('run'),
        'discord-ipc-0'
    )) ~= nil,
}
