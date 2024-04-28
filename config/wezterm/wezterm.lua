local wezterm = require'wezterm'

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end -- set config choices here
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.font = wezterm.font('Victor Mono', { weight="DemiBold" })

-- Setup remote access to my server
config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'wiki.lauers.au',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = '172.105.117.139',
    -- The username to use on the remote host
    username = 'webserver',
  },
}

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
