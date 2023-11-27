local map = require("utils").map

-- Overwrite the :w to call the function Save_file()
vim.cmd("command! W lua Save_file()")
vim.cmd [[cnoreabbrev w W]]

--General
map({ 'n', 'v', 't' }, ';', ':')
map({ 'n', 'v', 't' }, "'", ',')
map({ 'n', 'v', 't' }, '&', '<cmd>noh<cr>')
map({ 'n', 'v' }, 'R', '"', { desc = 'Register Registration' }) --  Register registration
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-c>', '<cmd>checktime<cr>', { desc = 'Refresh Buffers' })
map({ 'n', 'v' }, ',', '<Esc>,')
map({ 'n', 'v' }, '<C-s>', Save_file, { desc = 'Salve Buffer' })
map({ 'n' }, 'U', 'C-r>')
map('x', "<leader>p", [["_dP]])
map({ 'v', 'n' }, "<leader>d", [["_d]])

map("n", "<space>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace under cursor current file'})
map("n", "n", "nzzzv")                                                        -- Improved n
map("n", "N", "Nzzzv")                                                        -- Improved N

-- Moving
map({ 'n', 'v' }, 'J', '<C-f>zz')
map({ 'n', 'v' }, 'K', '<C-b>zz')
map({ 'n', 'v' }, 'H', '{')
map({ 'n', 'v' }, 'L', '}')

-- Buffer moving
-- map('n', '<Tab><Tab>', '<esc><C-w><C-w>', { desc = 'Next [Buffer]' })
map('n', '<Tab>l', '<Esc><cmd>bn<cr>', { desc = 'Right [Buffer]' })
map('n', '<Tab>h', '<Esc><cmd>bp<cr>', { desc = 'Left [Buffer]' })
map('n', '<Tab>d', '<Esc><cmd>bnext<bar>bd#<cr>', { desc = 'Delete [Buffer]' })
map('n', '<Tab>v', '<Esc><cmd>vert<space>sbNext<cr>', { desc = 'Split Vertical with next [Buffer]' })

-- identing
map("v", "<", "<gv")
map("v", ">", ">gv")


-- Telescope
local telescope_builtin = require('telescope.builtin')

-- TODO: Move all of that to Telescope.lua
-- map({ 'n', 'v' }, '<leader>ss', telescope_builtin.treesitter, { desc = '[S]earch [S]ymbols' })
map({ 'n', 'v' }, '<leader>sg', telescope_builtin.git_files, { desc = '[F]ind [F]iles in Git' })
map({ 'n', 'v' }, '<leader>sf', telescope_builtin.find_files, { desc = '[F]ind [F]iles the Original' })
map({ 'n', 'v' }, '<leader>fw', telescope_builtin.live_grep, { desc = '[F]ind in [W]orkspace' })
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


-- Just for documentation
-- map('n', 'gd', function() return require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor()) end)

-- Terminal
map({ 'n', 't', 'v' }, '<leader>t', '<cmd>ToggleTerm size=40<cr>')
map('t', ':q', '<cmd>ToggleTerm size=40<cr>')

-- Git
map({ 'n', 'v' }, '<localleader>gd', '<cmd>Gitsigns diffthis origin/main<cr>', { desc = '[G]it [D]iff Main' })

map({ 'n', 'v' }, '<F3>', '<cmd>!code . && code %<cr>', { desc = 'Open repo and file in VSCode' })
map({ 'n', 'v' }, '<F4>', '<cmd>!code %<cr>', { desc = 'Open file in VSCode' })

map({ 'n', 'v' }, 'B', function()
  telescope_builtin.buffers(require('telescope.themes').get_dropdown {
    previewer = false
  })
end, { desc = 'Select [B]uffers' })

map({ 'n', 'v' }, '<leader>z', '<cmd>ZenMode<cr>', { desc = '[Z]en [M]ode' })

map({ 'v' }, '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
map({ 'v' }, '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })


-- Copilot keymaps, here for lack of better place
-- vim.cmd([[imap <silent><script><expr> <S-Tab> copilot#Accept("\<CR>")]])
-- vim.cmd([[let g:copilot_no_tab_map = v:true]])
