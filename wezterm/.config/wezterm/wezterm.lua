local wezterm = require 'wezterm'
local sessionizer = require("sessionizer")

local config = wezterm.config_builder()

config.color_scheme = 'Batman'
config.font_size = 16
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {

  ----------------- Multiplexing -----------------
  -- Pane splitting
  { key = "|", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "-", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },

  -- Pane navigation
  { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
  { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },
  { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
  { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },

  -- Tab management
  { key = "c", mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "w", mods = "LEADER", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
  { key = "n", mods = "LEADER", action = wezterm.action { ActivateTabRelative = 1 } },
  { key = "p", mods = "LEADER", action = wezterm.action { ActivateTabRelative = -1 } },

  -----------------------------------------------
  -- Sessionizer --
  { key = "f", mods = "LEADER", action = wezterm.action_callback(sessionizer.toggle) },
  { key = "F", mods = "LEADER", action = wezterm.action_callback(sessionizer.resetCacheAndToggle) },
}

return config
