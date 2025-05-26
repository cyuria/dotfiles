---@type LazySpec
return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {
            style = "night",
            light_style = "day",
            day_brightness = 0.6,
            dim_inactive = true,
            on_colors = function(colours)
                colours.comment = "#738ca4"
                colours.bg_sidebar = nil
                colours.bg_float = nil
                colours.bg_statusline = nil
            end,
            on_highlights = function(hl, c)
                hl.Folded = {
                    bg = nil,
                    fg = '#7b869c'
                }
                local blank = {
                    bg = nil,
                    fg = "#000000",
                }

                -- Telescope
                hl.TelescopePreviewTitle = blank
                hl.TelescopeResultsTitle = blank
                hl.TelescopeBorder = {
                    bg = nil,
                    fg = hl.TelescopeBorder.fg, -- Use the default brder colour
                }
                hl.TelescopeNormal = {
                    bg = nil,
                    fg = nil
                }

                hl.TelescopePromptNormal = {
                    bg = nil,
                    fg = c.fg_dark,
                }
                hl.TelescopePromptBorder = {
                    bg = nil,
                    fg = '#20222a',
                }
                hl.TelescopePromptTitle = {
                    bg = nil,
                    fg = '#8c94aa',
                }

                hl.TabLineSel = {
                    fg = c.fg_dark,
                    bg = nil,
                }
                hl.TabLine = {
                    fg = c.fg_gutter,
                    bg = nil,
                }
            end,
        },
    },
}
