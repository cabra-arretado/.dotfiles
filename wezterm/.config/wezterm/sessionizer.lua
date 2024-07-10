-- https://github.com/wez/wezterm/discussions/4796#discussion-6082727
local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/opt/homebrew/bin/fd"
local homePath = wezterm.home_dir
local rootPath = homePath .. "/workspace"

local cached = {}

M.resetCacheAndToggle = function(window, pane)
  cached = {}
  M.toggle(window, pane)
end

M.toggle = function(window, pane)
  local projects = {}

  -- TODO: maybe `find` should be enough here
  if next(cached) == nil then
    local success, stdout, stderr = wezterm.run_child_process({
      fd,
      "-H",
      "-I",
      "-td",
      "^.git$",
      "-d",
      "3",
      rootPath,
    })

    if not success then
      wezterm.log_error("Failed to run fd: " .. stderr)
      return
    end

    for line in stdout:gmatch("([^\n]*)\n?") do
      local project = line:gsub("/.git/$", "")
      local id = project:gsub(".*/", "")
      table.insert(projects, { label = tostring(project), id = tostring(id) })
    end
    cached = projects
  end

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          wezterm.log_info("Selected " .. label)
          win:perform_action(
            act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
            pane
          )
        end
      end),
      fuzzy = true,
      title = "Select project",
      choices = cached,
    }),
    pane
  )
end

return M
