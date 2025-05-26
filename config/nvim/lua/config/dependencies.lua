local version = vim.version()

return {
    enable = version.major >= 1 or version.minor >= 11,
}
