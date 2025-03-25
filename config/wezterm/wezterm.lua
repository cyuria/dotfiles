local wezterm = require'wezterm'

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end -- set config choices here
config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.colors = {
  scrollbar_thumb = '#2D2A2C',
}

local bg = require'background'
config.background = bg.get()

config.status_update_interval = 2000

wezterm.on('update-status', function(window, _)
    local overrides = window:get_config_overrides() or {}
    overrides.background = bg.get()
    window:set_config_overrides(overrides)
end)

wezterm.on('gui-startup', function(cmd)
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
