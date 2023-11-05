-- Place to install small plugins setups

local default_only_plugins = { 'gitsigns' }

-- Setup Plugins just with default setup
-- TODO: Protect the calls here
for _, plugin in ipairs(default_only_plugins) do
  require(plugin).setup({})
end

-- TODO: Protect the calls here
require('todo-comments').setup({
  keywords = {
    FIX = {
      icon = " ",                              -- icon used for the sign, and in search results
      color = "error",                            -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning", alt = { 'TODOfm', 'todofm', 'TICKET', 'ticket' } },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  highlight = {
    after = "",                    -- "fg" or "bg" or empty
  },
})
