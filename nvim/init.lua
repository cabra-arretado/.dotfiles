local cmd = vim.cmd --- to execute string as vim command
local g = vim.g -- to access global variables
local opt = vim.opt -- to set options
local api = vim.api -- access the VIM Lua API

-- Leader to be declared before plugins
g.mapleader = ','
g.maplocalleader = '\\'

require('globals')
require('plugins')
require('telescope-setup')
require('treesitter-setup')
require('neotree-setup')
require('bufferline-setup')
require('lualine-setup')
require('lsp-setup')
require('cmp-setup')
require('term-setup')
require('diversos-setup')

opt.number = true
opt.relativenumber = true
opt.shortmess:append({ W = true, I = true, c = true })
opt.cursorline = true
opt.splitright = true
opt.completeopt = "menu,menuone,noselect"
opt.termguicolors = true
opt.cursorline = true
opt.ignorecase = true
opt.visualbell = true
opt.smartcase = true
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.laststatus = 3
opt.shiftwidth = 4
opt.list = true
-- opt.listchars:append "eol:↵" -- other options( ↩ , ↴ , ↵ )
opt.listchars:append "trail:·"
opt.breakindent = true
opt.linebreak = true
g.mapleader = ','
g.maplocalleader = '\\'
g.markdown_remmended_style = 0

-- Theme
local theme = [[tokyonight]]
cmd.colorscheme(theme)


-- tmux nav
cmd([[let g:tmux_navigator_disable_when_zoomed = 1]])

--  Require Keymaps after the opts
require('keymaps')
require('autocmds')
