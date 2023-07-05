local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'rcarriga/nvim-notify',
    lazy = false,
    priority = 1000,
    opts = {
      -- TODO: Make the stages "fade" work without warning
      stages = "static"
    },
    init = function() vim.notify = require('notify') end
  },
  { 'lewis6991/gitsigns.nvim' },
  { 'tpope/vim-fugitive' },
  {
    'tpope/vim-commentary',
  },
  { 'christoomey/vim-tmux-navigator', },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    opts = {}
  },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },
  { 'akinsho/bufferline.nvim' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = {
        "help",
        "neo-tree",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'L3MON4D3/LuaSnip',
    },
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true
  },
  {
    'folke/todo-comments.nvim',
    lazy = true
  },
  { "stevearc/dressing.nvim" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
    priority = 999,
  },
  {
    "rebelot/kanagawa.nvim",
    event = "VeryLazy",
  },
  { 'RRethy/vim-illuminate' },
}
)
