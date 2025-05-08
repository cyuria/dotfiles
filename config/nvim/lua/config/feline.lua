local separators = require'feline.defaults'.statusline.separators.default_value

local vi_mode_colors = {
    NORMAL = "teal",
    OP = "teal",
    INSERT = "yellow",
    VISUAL = "purple",
    LINES = "orange",
    BLOCK = "red1",
    REPLACE = "red",
    VREPLACE = "red",
    COMMAND = "cyan",
}

local vim_mode = {
    provider = {
        name = "vi_mode",
        opts = {
            padding = "center",
            show_mode_name = true,
        },
    },
    hl = function ()
        return {
            fg = require("feline.providers.vi_mode").get_mode_color(),
            bg = "bg_highlight",
            style = "bold",
            name = "NeovimModeHLColor",
        }
    end,
}
local vim_mode_inactive = {
    provider = {
        name = "vi_mode",
        opts = {
            padding = "center",
        },
    },
    hl = function ()
        return {
            fg = "fg",
            bg = "bg_highlight",
            style = "bold",
            name = "NeovimModeHLColor",
        }
    end,
}
local lazyStatus = {
    provider = function ()
        return require('lazy.status').updates() or '    '
    end,
    hl = function ()
        return {
            fg = require("feline.providers.vi_mode").get_mode_color(),
            bg = "bg_highlight",
            style = "bold",
            name = "NeovimModeHLColor",
        }
    end,
}
local gitBranch = {
    provider = "git_branch",
    hl = {
        fg = "orange",
        bg = "bg_highlight",
        style = "bold",
    },
}
local fileinfo = {
    provider = {
        name = "file_info",
        opts = {
            type = "relative-short",
        },
    },
    hl = {
        style = "bold",
    },
    left_sep = " ",
    right_sep = " ",
}
local diagnostic_errors = {
    provider = "diagnostic_errors",
    hl = {
        fg = "red",
    },
}
local diagnostic_warnings = {
    provider = "diagnostic_warnings",
    hl = {
        fg = "yellow",
    },
}
local diagnostic_hints = {
    provider = "diagnostic_hints",
    hl = {
        fg = "cyan",
    },
}
local diagnostic_info = {
    provider = "diagnostic_info",
}
local lsp_client_names = {
    provider = "lsp_client_names",
    hl = {
        fg = "purple",
        style = "bold",
    },
}
local file_type = {
    provider = {
        name = "file_type",
        opts = {
            filetype_icon = true,
            case = "titlecase",
        },
    },
    hl = {
        fg = "blue5",
        bg = "bg",
        style = "bold",
    },
}
local position = {
    provider = "position",
    hl = {
        fg = "orange",
        bg = "bg_dark",
        style = "bold",
    },
    left_sep = {
        always_visible = true,
        str = separators.left_filled,
        hl = {
            fg = "bg_dark",
            bg = "bg",
        },
    },
}
local line_percentage = {
    provider = "line_percentage",
    hl = {
        fg = "red",
        bg = "bg_dark",
        style = "bold",
    },
    left_sep = "left_filled",
}
local scroll_bar = {
    provider = "scroll_bar",
    hl = {
        fg = "red",
        bg = "bg_dark",
        style = "bold",
    },
    left_sep = "left_filled",
}

local function text(content, colour)
    return {
        provider = function () return content end,
        hl = { bg = colour, },
    }
end
local function separate(fg, bg, left)
    local separator = {
        str = left and separators.left_filled or separators.right_filled,
        hl = { bg = bg, fg = fg, },
    }
    local spacer = {
        provider = function () return ' ' end,
        hl = { bg = fg, },
    }
    if left then
        spacer.left_sep = separator
    else
        spacer.right_sep = separator
    end

    return spacer
end

local left = {
    text(' ', "bg_highlight"),
    vim_mode,
    lazyStatus,
    gitBranch,
    separate("bg_highlight", nil, false),
}
local leftinactive = {
    text(' ', "bg_highlight"),
    vim_mode_inactive,
    text(' ', "bg_highlight"),
    gitBranch,
    separate("bg_highlight", nil, false),
}
local middle = {
    fileinfo,
    diagnostic_errors,
    diagnostic_warnings,
    diagnostic_info,
    diagnostic_hints,
}
local right = {
    lsp_client_names,
    text('  ', "bg_dark"),
    file_type,
    text(' ', "bg_dark"),
    position,
    line_percentage,
    scroll_bar,
}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        leftinactive,
        middle,
        right,
    },
}

return {
    components=components,
    theme=require'tokyonight.colors'.setup(),
    vi_mode_colors=vi_mode_colors,
}
