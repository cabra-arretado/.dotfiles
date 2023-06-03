require 'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "python", "lua", "dot", "json", "bash",
    "dockerfile", "yaml", "hcl", "javascript", "typescript" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  --> ignore_install = { "javascript" },
  indent = {
    enable = true
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
