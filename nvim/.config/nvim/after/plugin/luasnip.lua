-- Video: https://www.youtube.com/watch?v=Dn800rlPIho
-- Example: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/luasnip.lua
--
local ok, luasnip = pcall(require, "luasnip")

if not ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

local types = require("luasnip.util.types")

luasnip.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}


-- create snippet
-- s(context, nodes, condition, ...)
local snippet = luasnip.s

-- TODO: Write about this.
--  Useful for dynamic nodes and choice nodes
local snippet_from_nodes = luasnip.sn

-- This is the simplest node.
--  Creates a new text node. Places cursor after node by default.
--  t { "this will be inserted" }
--
--  Multiple lines are by passing a table of strings.
--  t { "line 1", "line 2" }
local t = luasnip.text_node

-- Insert Node
--  Creates a location for the cursor to jump to.
--      Possible options to jump to are 1 - N
--      If you use 0, that's the final place to jump to.
--
--  To create placeholder text, pass it as the second argument
--      i(2, "this is placeholder text")
local i = luasnip.insert_node

-- Function Node
--  Takes a function that returns text
local f = luasnip.function_node

-- This a choice snippet. You can move through with <c-l> (in my config)
--   c(1, { t {"hello"}, t {"world"}, }),
--
-- The first argument is the jump position
-- The second argument is a table of possible nodes.
--  Note, one thing that's nice is you don't have to include
--  the jump position for nodes that normally require one (can be nil)
local c = luasnip.choice_node

local d = luasnip.dynamic_node

luasnip.snippets = {
  all = {
    --All file types
    luasnip.parser.parse_snippet("expand", "-- This is what was spanded")
  },
  lua = {
  }
}

vim.keymap.set({ "i", "s" }, "<M-q>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })
