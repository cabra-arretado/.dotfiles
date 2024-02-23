local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
  return
end

local map = require("utils").map

map({ 'n', 'v' }, '<leader>n', '<cmd>NvimTreeFindFileToggle<cr>', { desc = '[N]eotree' })

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 'U', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Vertical Split'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
end

nvimtree.setup({
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  -- view = {
  -- adaptive_size = true,
  -- },
  renderer = {
    indent_markers = {
      enable = true
    },
    add_trailing = true,
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})
