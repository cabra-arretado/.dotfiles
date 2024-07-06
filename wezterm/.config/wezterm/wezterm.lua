local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Batman'
config.font_size = 17
config.window_decorations = "RESIZE"

return config
