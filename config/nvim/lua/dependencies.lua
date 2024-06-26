local version = vim.version()

local function get_gnu_make()
    local makes = { "gmake", "make" }
    for _, make in ipairs(makes) do
        if vim.fn.executable(make) == 1 then
            return make
        end
    end
end

return {
    enable_unmerged = false,
    enable_plugins = version.major >= 1 or version.minor >= 8,
    enable_loader = version.major >= 1 or version.minor >= 10,
    enable_github = vim.fn.executable 'gh' == 1,
    enable_discord = vim.fn.executable 'discord' == 1,
    gmake = get_gnu_make(),
}
