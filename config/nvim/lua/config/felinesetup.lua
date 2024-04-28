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

local c = {
    vim_mode = {
        provider = {
            name = "vi_mode",
            opts = {
                padding = "center",
                show_mode_name = true,
            },
        },
        hl = function()
            return {
                fg = require("feline.providers.vi_mode").get_mode_color(),
                bg = "bg_highlight",
                style = "bold",
                name = "NeovimModeHLColor",
            }
        end,
    },
    vim_mode_inactive = {
        provider = {
            name = "vi_mode",
            opts = {
                padding = "center",
            },
        },
        hl = function()
            return {
                fg = "fg",
                bg = "bg_highlight",
                style = "bold",
                name = "NeovimModeHLColor",
            }
        end,
    },
    lazyStatus = {
        provider = function()
            local lazystatus = require'lazy.status'
            return lazystatus.updates() or ' 󰴋  '
        end,
        hl = function()
            return {
                fg = require("feline.providers.vi_mode").get_mode_color(),
                bg = "bg_highlight",
                style = "bold",
                name = "NeovimModeHLColor",
            }
        end,
    },
    gitBranch = {
        provider = "git_branch",
        hl = {
            fg = "orange",
            bg = "bg_highlight",
            style = "bold",
        },
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = "green",
            bg = "bg_highlight",
        },
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
            bg = "bg_highlight",
        },
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = "fg",
            bg = "bg_highlight",
        },
    },
    leftmidsep = {
        provider = "",
        left_sep = {
            always_visible = true,
            str = separators.right_filled,
            hl = { fg = "bg_highlight", },
        },
    },
    fileinfo = {
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
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        hl = {
            fg = "red",
        },
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        hl = {
            fg = "yellow",
        },
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        hl = {
            fg = "cyan",
        },
    },
    diagnostic_info = {
        provider = "diagnostic_info",
    },
    lsp_client_names = {
        provider = "lsp_client_names",
        hl = {
            fg = "purple",
            bg = "fg_gutter",
            style = "bold",
        },
    },
    file_type = {
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
    },
    file_encoding = {
        provider = "file_encoding",
        hl = {
            fg = "yellow",
            bg = "bg",
            style = "italic",
        },
    },
    position = {
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
    },
    line_percentage = {
        provider = "line_percentage",
        hl = {
            fg = "red",
            bg = "bg_dark",
            style = "bold",
        },
        left_sep = "left_filled",
    },
    scroll_bar = {
        provider = "scroll_bar",
        hl = {
            fg = "red",
            bg = "bg_dark",
            style = "bold",
        },
        left_sep = "left_filled",
    },
}

local function getSpace(colour)
    return {
        provider = function() return ' ' end,
        hl = { bg = colour, },
    }
end
local function getSpacer(fg, bg, left)
    local separator = {
        str = left and separators.left_filled or separators.right_filled,
        hl = { bg = bg, fg = fg, },
    }
    local spacer = {
        provider = function() return ' ' end,
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
    getSpace("bg_highlight"),
    c.vim_mode,
    c.lazyStatus,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    getSpacer("bg_highlight", nil, false),
}
local leftinactive = {
    getSpace("bg_highlight"),
    c.vim_mode_inactive,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    getSpacer("bg_highlight", nil, false),
}
local middle = {
    c.fileinfo,
    c.diagnostic_errors,
    c.diagnostic_warnings,
    c.diagnostic_info,
    c.diagnostic_hints,
}
local right = {
    getSpacer("fg_gutter", nil, true),
    c.lsp_client_names,
    getSpace("fg_gutter"),
    getSpacer("bg_dark", "fg_gutter", true),
    c.file_type,
    getSpace("bg_dark"),
    c.position,
    c.line_percentage,
    c.scroll_bar,
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
