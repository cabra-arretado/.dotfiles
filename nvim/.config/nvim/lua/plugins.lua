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
  { 'mbbill/undotree' },
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
  {
    'lewis6991/gitsigns.nvim',
    opts = {}
  },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-commentary' },
  { 'christoomey/vim-tmux-navigator', },
  {
    'neovim/nvim-lspconfig',
    -- TODO: LSPzero update
    -- https://github.com/VonHeikemen/lsp-zero.nvim
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
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
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
      'rafamadriz/friendly-snippets',
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
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          keys = { "f", "F", "t", "T", "," },
        }
      }
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
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
  { 'RRethy/vim-illuminate' },
  {
    -- TODO: Finish to test this out
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,
    },
  },
  {
    "folke/neodev.nvim",
    opts = {}
  },
  {
    "folke/zen-mode.nvim",
    opts = {}
  },
  {
    "rebelot/kanagawa.nvim",
  },
  ---------------------------------------------------
  -- THEMES NOT USED
  --
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  -- { 'rose-pine/neovim', name = 'rose-pine' },
  --
  ---------------------------------------------------
}
)
