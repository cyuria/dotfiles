
local doubleschemes = {
    "edge",
    "gruvbox",
    "everforest",
    "kanagawa",
    "lunaperche",
    "melange",
    "quiet",
    "retrobox",
    "tokyonight",
    "wildcharm",
    "zenbones",
}

-- Set default light and dark schemes and configure colorscheme dependent options
vim.g.darkscheme = "slate"
vim.g.lightscheme = "shine"
if require 'dependencies'.enable_plugins then
    vim.g.darkscheme = "evergarden"
    vim.g.lightscheme = "dayfox"

    vim.g.gruvbox_contrast_dark = 'soft'
    vim.g.gruvbox_baby_telescope_theme = 1
    vim.g.gruvbox_baby_transparent_mode = 1
end

-- Setup light and dark mode functions and mappings
local function transparent_bg(groups)
    for _, g in ipairs(groups) do
        vim.cmd('highlight ' .. g .. ' guibg=none')
    end
end
local function make_transparent()
    transparent_bg {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "NonText",
        "EndOfBuffer",
        "BufferInactive",
        "BufferCurrent",
        "ZenBg",
    }
end
local function transparent_folds()
    transparent_bg {
        "Folded",
    }
end
local function dark()
    local double = vim.tbl_contains(doubleschemes, vim.g.colors_name)
    vim.o.background = 'dark'
    if not double then
        vim.g.lightscheme = vim.g.colors_name or vim.g.lightscheme
        vim.cmd('colorscheme ' .. vim.g.darkscheme)
    end
end
local function light()
    local double = vim.tbl_contains(doubleschemes, vim.g.colors_name)
    vim.o.background = 'light'
    if not double then
        vim.g.darkscheme = vim.g.colors_name or vim.g.darkscheme
        vim.cmd('colorscheme ' .. vim.g.lightscheme)
    end
end
local function random_scheme()
    local schemes = vim.fn.getcompletion("", "color")
    local scheme = schemes[math.random(#schemes)]
    vim.cmd('colorscheme ' .. scheme)
end
vim.api.nvim_create_user_command('Transparent', make_transparent, {})
vim.api.nvim_create_user_command('TransparentFolds', transparent_folds, {})
vim.api.nvim_create_user_command('Dark', dark, {})
vim.api.nvim_create_user_command('Light', light, {})
vim.api.nvim_create_user_command('RandomColours', random_scheme, {})

return {
    dark = dark,
    light = light,
    make_transparent = make_transparent,
    transparent_folds = transparent_folds,
    random_scheme = random_scheme,
}
