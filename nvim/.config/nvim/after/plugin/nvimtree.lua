local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
  return
end

local map = require("utils").map

map({ 'n', 'v' }, '<leader>n', '<cmd>NvimTreeFindFileToggle<cr>', { desc = '[N]eotree' })

-- local function my_on_attach(bufnr)
--   local api = require('nvim-tree.api')

--   local function opts(desc)
--     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end

--   api.config.mappings.default_on_attach(bufnr)

--   vim.keymap.set('n', 'O', '', { buffer = bufnr })
--   vim.keymap.del('n', 'O', { buffer = bufnr })
--   vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
--   vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
--   vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
--   vim.keymap.del('n', '<C-k>', { buffer = bufnr })
--   vim.keymap.set('n', '<C-v>', '', { buffer = bufnr })
--   vim.keymap.del('n', '<C-v>', { buffer = bufnr })
--   vim.keymap.set('n', 'E', '', { buffer = bufnr })
--   vim.keymap.del('n', 'E', { buffer = bufnr })

--   vim.keymap.set('n', 'v', api.node.open.vertical, opts('Expand All'))
--   vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
--   vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
--   vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
-- end

nvimtree.setup({
  -- on_attach = my_on_attach,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true
    },
    add_trailing = true,
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
