local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font SemBd'
config.font_size = 13
config.color_scheme = 'Tokyo Night'
config.enable_tab_bar = false
config.window_background_opacity = 0.8

config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.disable_default_key_bindings = true
config.keys = {
    -- This will create a new split and run the `top` program inside it
    {
        key = 'i',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
}

return config
