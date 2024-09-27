local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Tokyo Night'

config.font = wezterm.font_with_fallback {
  'CommitMono'
}

config.font_size = 16

return config
