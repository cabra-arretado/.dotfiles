local ensure_packer = function()
  -- Ensure that Packer is installed on Neovim start
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'navarasu/onedark.nvim' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-commentary' }
    use { 'junegunn/fzf' }
    use { 'junegunn/fzf.vim' }
    use { 'christoomey/vim-tmux-navigator' }
    use { 'neovim/nvim-lspconfig',
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
      }, }
    use { 'nvim-treesitter/nvim-treesitter' }
    -- use { -- Additional text objects via treesitter
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    --   after = 'nvim-treesitter',
    -- }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim' }
    use { 'akinsho/bufferline.nvim' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'L3MON4D3/LuaSnip',
      } }
    use { 'akinsho/toggleterm.nvim' }
    use { 'phaazon/hop.nvim' }
    use { 'folke/todo-comments.nvim' }
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
