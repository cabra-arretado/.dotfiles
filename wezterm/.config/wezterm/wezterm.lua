local wezterm = require 'wezterm'
local sessionizer = require("sessionizer")

local config = wezterm.config_builder()


wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane;
  local title = pane.title;

  -- Customize the title based on the current process or other conditions
  if title == "v" then
    return "Neovim";
  elseif string.find(title, "top") then
    return "System Monitor";
  else
    return title;  -- Default to the original title if no condition matches
  end
end)

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
  -- { key = "s", mods = "LEADER", action = wezterm.action { }
}

return config
