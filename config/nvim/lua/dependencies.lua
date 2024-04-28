local version = vim.version()

return {
    enable_unmerged = false,
    enable_plugins = version.major >= 1 or version.minor >= 8,
    enable_loader = version.major >= 1 or version.minor >= 10,
    enable_github = vim.fn.executable 'gh' == 1,
    enable_discord = vim.fn.executable 'discord' == 1,
}
