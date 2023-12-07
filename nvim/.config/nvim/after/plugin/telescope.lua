local ok, telescope = pcall(require, "telescope")

if not ok then
  return
end

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " 🔍  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
      vertical = {
        mirror = false,
      },
      preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
    path_display = { "truncate" },
    winblend = 0,
    border = true,
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["J"] = "preview_scrolling_down",
        ["K"] = "preview_scrolling_up",
        ["v"] = "select_vertical",
      },
    },
  },
  pickers = {
    oldfiles = {
      only_cwd = true,
      initial_mode = 'normal',
    },
    lsp_definitions = {
      jump_type = 'never',
      initial_mode = 'normal',
    },
    jumplist = {
      initial_mode = 'normal',
    },
    registers = {
      initial_mode = 'normal',
    },
    git_status = {
      initial_mode = 'normal',
    },
    git_commits = {
      initial_mode = 'normal',
    },
    git_bcommits = {
      initial_mode = 'normal',
    },
    git_branches = {
      initial_mode = 'normal',
    },
    lsp_references = {
      initial_mode = 'normal',
    },
    lsp_incoming_calls = {
      initial_mode = 'normal',
    },
    lsp_dynamic_workspace_symbols = {
      initial_mode = 'normal',
    },
    git_stash = {
      initial_mode = 'normal',
    },
    buffers = {
      initial_mode = 'normal',
      mappings = {
	n = {
	  ["x"] = require("telescope.actions").delete_buffer,
	  ["B"] = require("telescope.actions").move_selection_next,
	  ["b"] = require("telescope.actions").select_default,
	},
      },
    },
  },
}

-- Mappings
local map = require("utils").map
local telescope_builtin = require('telescope.builtin')

map({ 'n', 'v' }, '<leader>sg', telescope_builtin.git_files, { desc = '[F]ind [F]iles in Git' })
map({ 'n', 'v' }, '<leader>sf', telescope_builtin.find_files, { desc = '[F]ind [F]iles the Original' })
map({ 'n', 'v' }, '<leader>sw', telescope_builtin.live_grep, { desc = '[F]ind in [W]orkspace' })
map({ 'n', 'v' }, '<leader>sp', telescope_builtin.builtin, { desc = '[S]earch Telescope [B]uiltins Pickers' })
map({ 'n', 'v' }, '<leader>sc', telescope_builtin.grep_string, { desc = '[S]earch String Under [C]ursor' })
map({ 'n', 'v' }, '<leader>sr', telescope_builtin.registers, { desc = '[S]earch [R]egisters' })
map({ 'n', 'v' }, '<leader>sj', telescope_builtin.jumplist, { desc = '[S]earch [J]umplist' })
map({ 'n', 'v' }, '<leader>gc', telescope_builtin.git_commits, { desc = '[G]it [C]ommits' })
map({ 'n', 'v' }, '<leader>gbr', telescope_builtin.git_branches, { desc = '[G]it [B]ranches' })
map({ 'n', 'v' }, '<leader>gs', telescope_builtin.git_status, { desc = '[G]it [S]tatus' })
map({ 'n', 'v' }, '<leader>km', telescope_builtin.keymaps, { desc = '[K]ey[m]aps' })
map({ 'n', 'v' }, '<leader>h', telescope_builtin.help_tags, { desc = '[H]elp Neovim' })
map({ 'n', 'v' }, '<leader>o', telescope_builtin.oldfiles, { desc = 'Last Opened Files. [O]ld files' })
map({ 'n', 'v' }, '<leader>cs', telescope_builtin.colorscheme, { desc = 'Change colorscheme' })
map({ 'n', 'v' }, '<leader>st', '<cmd>TodoTelescope<cr>', { desc = '[F]ind [T]odo' })
map({ 'n', 'v' }, '<leader>gb', '<cmd>Gitsigns blame_line<cr>', { desc = '[G]it [B]lame [L]ine' })
map({ 'n', 'v' }, '<leader>/', function()
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = false
  })
end, { desc = '[/] Fuzzy find in the current buffer]' })
map({ 'n', 'v' }, '<leader>m', require("telescope").extensions.notify.notify, { desc = 'Show Messages (Notify)' })

