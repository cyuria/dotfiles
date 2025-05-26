---@type LazySpec
return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        opts = {
            -- Remove gutter background
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = nil
                        }
                    }
                }
            },
            overrides = function(colors)
                local ui = colors.theme.ui
                return {
                    -- Telescope
                    TelescopeTitle = { fg = ui.special, bold = true },
                    TelescopePromptNormal = { bg = ui.bg_p1 },
                    TelescopePromptBorder = { fg = ui.bg_p1, bg = ui.bg_p1 },
                    TelescopeResultsNormal = { fg = ui.fg_dim, bg = ui.bg_m1 },
                    TelescopeResultsBorder = { fg = ui.bg_m1, bg = ui.bg_m1 },
                    TelescopePreviewNormal = { bg = ui.bg_dim },
                    TelescopePreviewBorder = { bg = ui.bg_dim, fg = ui.bg_dim },
                    -- Popup menus
                    Pmenu = { fg = ui.shade0, bg = ui.bg_p1 },
                    PmenuSel = { fg = nil, bg = ui.bg_p2 },
                    PmenuSbar = { bg = ui.bg_m1 },
                    PmenuThumb = { bg = ui.bg_p2 },
                    -- Floating windows
                    NormalFloat = { bg = nil },
                    FloatBorder = { bg = nil },
                    NormalDark = { fg = ui.fg_dim, bg = ui.bg_m3 },
                    LazyNormal = { bg = ui.bg_m3, fg = ui.fg_dim },
                    MasonNormal = { bg = ui.bg_m3, fg = ui.fg_dim },
                }
            end,
        },
    },
}
