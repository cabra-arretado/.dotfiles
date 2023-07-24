local map = function(modes, lhs, rhs, opts)
  -- Parameters:
  -- -- mode: string or table of strings with the modes
  -- -- lhs: keys to bind
  -- -- rhs: existing command or keybidding
  -- -- opts: self descriptive
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(modes, lhs, rhs, options)
end

-- Overwrite the :w to call the function Save_file()
vim.cmd("command! W lua Save_file()")
vim.cmd[[cnoreabbrev w W]]


--General
map({ 'n', 'v', 't' }, ';', ':')
map({ 'n', 'v', 't' }, '&', '<cmd>noh<cr>')
map({ 'n', 'v' }, 'R', '"', { desc = 'Register Registration' }) --  Register registration
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-c>', '<cmd>checktime<cr>', { desc = 'Refresh Buffers' })
map({ 'n', 'v' }, ',', '<Esc>,')
map({'n', 'v'}, '<C-s>', Save_file, { desc = 'Salve Buffer' })
map({ 'n' }, 'U', 'C-r>')

-- Moving
map({ 'n', 'v' }, 'J', '<C-f>')
map({ 'n', 'v' }, 'K', '<C-b>')

-- Buffer control
-- map('n', '<Tab><Tab>', '<esc><C-w><C-w>', { desc = 'Next [Buffer]' })
map('n', '<Tab>l', '<Esc><cmd>bn<cr>', { desc = 'Right [Buffer]' })
map('n', '<Tab>h', '<Esc><cmd>bp<cr>', { desc = 'Left [Buffer]' })
map('n', '<Tab>d', '<Esc><cmd>bnext<bar>bd#<cr>', { desc = 'Delete [Buffer]' }) --- fmtodo: create function in lua that creates new buffer if the current is the one being deleted and is the last one
map('n', '<Tab>v', '<Esc><cmd>vert<space>sbNext<cr>', { desc = 'Split Vertical with next [Buffer]' })

-- identing
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Neotree
map({ 'n', 'v' }, '<leader>n', '<cmd>Neotree toggle left reveal<cr>', { desc = '[N]eotree' })
map({ 'n', 'v' }, '<leader>sb', '<cmd>Neotree toggle float reveal buffers<cr>', { desc = '[S]earch [B]uffers' })

-- Telescope
local telescope_builtin = require('telescope.builtin')

map({ 'n', 'v' }, '<leader>ss', telescope_builtin.treesitter, { desc = '[S]earch [S]ymbols' })
map({ 'n', 'v' }, '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
map({ 'n', 'v' }, '<C-p>', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
map({ 'n', 'v' }, '<leader>sw', telescope_builtin.live_grep, { desc = '[S]earch in [W]orkspace' })
map({ 'n', 'v' }, '<leader>sp', telescope_builtin.builtin, { desc = '[S]earch Telescope [B]uiltins Pickers' })
map({ 'n', 'v' }, '<leader>sc', telescope_builtin.grep_string, { desc = '[S]earch String Under [C]ursor' })
map({ 'n', 'v' }, '<leader>sg', telescope_builtin.git_files, { desc = '[S]earch [G]it Files' })
map({ 'n', 'v' }, '<leader>sr', telescope_builtin.registers, { desc = '[S]earch [R]egisters' })
map({ 'n', 'v' }, '<leader>sj', telescope_builtin.jumplist, { desc = '[S]earch [J]umplist' })
map({ 'n', 'v' }, '<leader>gc', telescope_builtin.git_commits, { desc = '[G]it [C]ommits' })
map({ 'n', 'v' }, '<leader>gbr', telescope_builtin.git_branches, { desc = '[G]it [B]ranches' })
map({ 'n', 'v' }, '<leader>gs', telescope_builtin.git_status, { desc = '[G]it [S]tatus' })
map({ 'n', 'v' }, '<leader>km', telescope_builtin.keymaps, { desc = '[K]ey[m]aps' })
map({ 'n', 'v' }, '<leader>h', telescope_builtin.help_tags, { desc = '[H]elp Neovim' })
map({ 'n', 'v' }, '<leader>o', telescope_builtin.oldfiles, { desc = 'Last Opened Files. [O]ld files' })
map({ 'n', 'v' }, '<leader>cs', telescope_builtin.colorscheme, { desc = 'Change colorscheme' })
map({ 'n', 'v' }, '<leader>d', '<cmd>TodoTelescope<cr>', { desc = '[T]o[D]o List' })
map({ 'n', 'v' }, '<leader>gb', '<cmd>Gitsigns blame_line<cr>', { desc = '[G]it [B]lame [L]ine' })
map({ 'n', 'v' }, '<leader>/', function()
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = false
  })
end, { desc = '[/] Fuzzy find in the current buffer]' })
map({ 'n', 'v' }, '<C-f>', function()
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = false
  })
end, { desc = '[/] Fuzzy find in the current buffer]' })
map({ 'n', 'v' }, '<leader>al', require("telescope").extensions.notify.notify, { desc = 'Show [A][L]erts (Notify)' })


-- Just for documentation
-- map('n', 'gd', function() return require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor()) end)

-- Terminal
map({ 'n', 't', 'v' }, '<leader>t', '<cmd>ToggleTerm size=40<cr>')
map('t', ':q', '<cmd>ToggleTerm size=40<cr>')

-- -- Hop
map({ 'n', 'v' }, '<leader>gdm', '<cmd>Gitsigns diffthis origin/main<cr>', { desc = '[G]it [D]iff [M]ain' })

map({ 'n', 'v' }, '<F3>', '<cmd>!code . && code %<cr>', { desc = 'Open repo and file in VSCode' })
map({ 'n', 'v' }, '<F4>', '<cmd>!code %<cr>', { desc = 'Open file in VSCode' })

-- TODO: test for the buffer change
map({ 'n', 'v' }, 'B', function()
  telescope_builtin.buffers(require('telescope.themes').get_dropdown {
    previewer = false
  })
end, { desc = '[/] Fuzzy find in the current buffer]' })
